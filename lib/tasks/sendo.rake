require 'rest-client'
require 'nokogiri'
require 'csv'
namespace :sendo do
  desc "TODO"
  task fetch_data: :environment do
    # "3891" => "vong-tay-phong-thuy"
    cats = { "3860" => "day-chuyen-vong-co",
      "3868" => "khuyen-tai",
      "3861" => "vong-lac-tay",
      "3862" => "charm",
      "3901" => "trang-suc-nhan",
      "3874" => "set-bo-trang-suc",
      "3863" => "trang-suc-co-the",
      "3865" => "trang-suc-cho-be",
      "3875" => "trang-suc-theo-phong-thuy",
      "3866" => "trang-suc-cap-doi",
      "3867" => "nguyen-lieu-dung-cu-lam-trang-suc",
      "1367" => "dong-ho-nam",
      "1372" => "dong-ho-nu",
      "2577" => "dong-ho-doi",
      "1382" => "dong-ho-cho-be",
      "1376" => "dong-ho-khac",
      "1387" => "phu-kien-dong-ho"
    }
    filename = File.dirname(File.dirname(File.expand_path(__FILE__))) + '/data/sitemap.csv'
    #cat_table = CSV.parse("data/sitemap.csv", headers: true)
    CSV.foreach("data/sitemap.csv", :headers => true) do |row|
      cat_id = row["cat2_id"]
      category = row["cat2_name"].parameterize
      next if cats.has_key? cat_id
      shop_list = {}
      page = 1
      CSV.open("data/#{category}_#{cat_id}.csv", "a+") do |csv|
        # write header
        csv << ["name", "phone", "email", "category", "count", "website", "lat", "lon"]
      end
      loop do
        response = RestClient.get "https://www.sendo.vn/m/wap_v2/category/product?category_id=#{cat_id}&listing_algo=algo5&p=#{page}&s=60&sortType=default_listing_desc"
        data = JSON.parse response.body
        max_page = data["result"]["meta_data"]["total_page"].to_i
        data["result"]["data"].each do |d|
          shop_name = d["shop_info"]["shop_name"]
          if shop_list.has_key?(shop_name)
            puts "#{shop_name} existed, count = #{shop_list[shop_name]["Count"]}"
            shop_list[shop_name]["Count"] += d["order_count"].to_i
            next
          end
          #shop_list << shop_name
          shop_dom = nil
          shop_info = {"Name" => shop_name, "Điện thoại" => "", "Email" => "", "Category" => category, "Count" => 0, "Website" => "", "lat" => "", "lon" => ""}
          begin

            #shop_url = "https://www.sendo.vn/shop/#{shop_name.parameterize}/thong-tin-shop/"
            product_url = d["cat_path"].sub(".html", "")
            product_url = "https://www.sendo.vn/m/wap_v2/full/san-pham/#{product_url}"
            # try to get shop info from product page
            response2 = RestClient.get product_url
            p_data = JSON.parse response2.body
            shop_url = "https://www.sendo.vn/" + p_data["result"]["data"]["shop_info"]["shop_url"]
            shop_info["lat"] = p_data["result"]["data"]["shop_info"]["warehouse_latitude"]
            shop_info["lon"] = p_data["result"]["data"]["shop_info"]["warehouse_longitude"]
            shop_dom = RestClient.get(shop_url + "/thong-tin-shop")
          rescue
            puts "I am rescued. shop name = #{shop_name}, product url = #{product_url}"
          end
          if(shop_dom.present?)
            shop_data = Nokogiri::HTML.parse(shop_dom.body)
            shop_data.css(".cont-shop-inf .address-shop-rw").each do |info|
              a = info.text.gsub("\n", "").gsub("\t", "").gsub("https://", "").strip.split(":")
              shop_info[a[0]] = a[1]
            end
            shop_list[shop_name] = shop_info
            shop_list[shop_name]["Count"] += d["order_count"].to_i
          end
        end
        page = page + 1
        if page > max_page
          CSV.open("data/#{category}_#{cat_id}.csv", "a+") do |csv|
            shop_list.each do |k, s|
              csv << s.values
            end
          end
          break
        end
      end
    end
  end

  desc "TODO"
  task fetch_categories: :environment do
    response = RestClient.get 'https://www.sendo.vn/sitemap/'
    data=Nokogiri::HTML.parse response.body
    CSV.open("data/sitemap.csv", "a+") do |csv|
      # write header
      csv << ["cat2_name", "cat2_id", "cat1_name", "cat1_id", "product_count"]
    end
    data.css(".site-map-block").each do |b|
      cat1_name = b.css(".site-map-title").text
      cat1_id = b["id"].split("-").last
      b.css(".site-map-item").each do |item|
        cat2_el = item.css(".title-lv-2").first
        cat2_url = cat2_el["href"]
        cat2_name = cat2_el["title"]
        cat2_res = RestClient.get cat2_url
        cat2_id = /"category_id":\d*/.match(cat2_res.body).to_s.split(":").last

        res3 = RestClient.get "https://www.sendo.vn/m/wap_v2/category/product?category_id=#{cat2_id}&listing_algo=algo5&p=1&s=60&sortType=default_listing_desc"
        cat2_info = JSON.parse res3.body
        pro_count = cat2_info["result"]["meta_data"]["total_count"]
        CSV.open("data/sitemap.csv", "a+") do |csv|
          # write header
          csv << [cat2_name, cat2_id, cat1_name, cat1_id, pro_count]
        end
      end
    end
  end
end
