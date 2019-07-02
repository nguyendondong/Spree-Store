module Spree
  HomeController.class_eval do
    helper 'spree/products'
    respond_to :html
    
    

    def index
      @show_default_image = true
      #@searcher = build_searcher(params.merge(include_images: true))
      @products = current_store.products.order("spree_products.score desc, spree_products.updated_at desc").page(params[:page]).per(12)
      @taxonomies = current_store.taxonomies.includes(root: :children)
      #@product_videos = Spree::Product.where.not(video_url: nil).limit(4)
      
      @search = Product.ransack(params[:q])

      respond_to do |format|
        format.html
        format.js
        format.json { render :json => json_data }
      end
    end


 

    def about_albums_competition

    end

    def sitemap
      path = Rails.root.join("public", "sitemaps", "sitemap.xml")
      if File.exists?(path)
        render xml: open(path).read
      else
        render text: "Sitemap not found.", status: :not_found
      end
    end
  end
end