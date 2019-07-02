# encoding: utf-8
namespace :post_offices do
  task :get_data => :environment do
    require 'csv'
    Dir.glob(Rails.root + "db/post_offices/*").each do |path|
      CSV.foreach(path, {:col_sep => ","}) do |row|
        if row[0].present?
          puts "#{row[0]} - #{row[1]} - #{row[2]}"
          post_office = Spree::PostOffice.new
          post_office.number = row[0]
          post_office.name = row[1]
          post_office.address = row[2]
          post_office.province = path.split("-")[1].split(".")[0].strip
          post_office.save
        end
      end
    end
  end

  task :map_to_district => :environment do
    Spree::PostOffice.all.each do |post_office|
      if post_office.address.present?
        district_name = post_office.address.split(",")[post_office.address.split(",").length - 1].strip
        districts = Spree::District.where("name like ? and state_id = ?", "%#{district_name}", post_office.state_id)
        if districts.count == 1
          post_office.update_attribute(:district_id, districts.first.id)
        elsif Spree::District.where("name like ? and state_id = ?", "%#{district_name}", post_office.state_id).count < 1
          district_name = district_name.gsub("Huyện", "").gsub("Thị xã", "").gsub("phường", "").gsub("Thành phố", "").gsub("Quận", "").strip
          district = Spree::District.where("name like ? and state_id = ?", "%#{district_name}", post_office.state_id).first
          post_office.update_attribute(:district_id, district.id) if district.present?
        end
      end
    end
  end

  task :map_to_state => :environment do
    Spree::PostOffice.all.each do |post_office|
      if post_office.province.present?
        state = Spree::State.where("name like ?", "%#{get_state(post_office.province)}%").first
        post_office.update_attribute(:state_id, state.id) if state.present?
      end
    end
  end
end

def get_state(province)
  map = {
      "AN GIANG" => "An Giang",
      "BA RIA VUNG TAU" => "Bà Rịa-Vũng Tàu",
      "BAC GIANG" => "Bắc Giang",
      "BAC LIEU" => "Bạc Liêu",
      "BAC NINH" => "Bắc Ninh",
      "BEN TRE" => "Bến Tre",
      "BINH DINH" => "Bình Định",
      "BINH DƯƠNG" => "Bình Dương",
      "BINH PHUOC" => "Bình Phước",
      "BINH THUAN" => "Bình Thuận",
      "CAN THO" => "Cần Thơ",
      "CAO BANG" => "Cao Bằng",
      "DA NANG" => "Đà Nẵng",
      "DAC NONG" => "Đắk Nông",
      "DACLAC" => "Đắk Lắk",
      "DIEN BIEN" => "Điện Biên",
      "DONG HA" => "DONG HA",
      "DONG HOI" => "DONG HOI",
      "DONG NAI" => "Đồng Nai",
      "DONG THAP" => "Đồng Tháp",
      "HA DONG" => "HA DONG",
      "HA GIANG" => "Hà Giang",
      "HA NOI" => "Hà Nội",
      "HA TAY" => "HA TAY",
      "HA TINH" => "Hà Tĩnh",
      "HAI DUONG" => "Hải Dương",
      "HAI PHONG" => "Hải Phòng",
      "HAU GIANG" => "Hậu Giang",
      "HOA BINH" => "Hòa Bình",
      "HON GAI" => "HON GAI",
      "HUNG YEN" => "Hưng Yên",
      "KHANH HOA" => "Khánh Hòa",
      "KIEN GIANG" => "Kiên Giang",
      "KONTUM" => "Kon Tum",
      "LAI CHAU" => "Lai Châu",
      "LAM DONG" => "Lâm Đồng",
      "LANG SON" => "Lạng Sơn",
      "LAO CAI" => "Lào Cai",
      "LONG AN" => "Long An",
      "NAM DINH" => "Nam Định",
      "NGHE AN" => "Nghệ An",
      "NINH BINH" => "Ninh Bình",
      "NINH THUAN" => "Ninh Thuận",
      "PHU LY" => "PHU LY",
      "PHU THO" => "Phú Thọ",
      "PLEKU" => "Gia Lai",
      "QUANG NAM" => "Quảng Nam",
      "QUANG NGAI" => "Quảng Ngãi",
      "SOC TRANG" => "Sóc Trăng",
      "SON LA" => "Sơn La",
      "TAY NINH" => "Tây Ninh",
      "THAI BINH" => "Thái Bình",
      "THAI NGUYEN" => "Thái Nguyên",
      "THANH HOA" => "Thanh Hóa",
      "TIEN GIANG" => "Tiền Giang",
      "TP HO CHI MINH" => "Hồ Chí Minh",
      "TRA VINH" => "Trà Vinh",
      "TT HUE" => "Thừa Thiên - Huế",
      "TUY HOA" => "TUY HOA",
      "TUYEN QUANG" => "Tuyên Quang",
      "VINH LONG" => "Vĩnh Long",
      "VINH YEN" => "VINH YEN",
      "YEN BAI" => "Yên Bái"
  }
  map[province]
end