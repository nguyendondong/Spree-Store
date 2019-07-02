module Spree
  BlogEntriesController.class_eval do
    before_filter :init_pagination, :only => [:index, :tag, :archive, :author, :category]
    def index
      @taxonomies = current_store.taxonomies.includes(root: :children)
      @blog_entries = current_store.blog_entries.visible.page(@pagination_page).per(@pagination_per_page)
    end
    def show
      if try_spree_current_user.try(:has_spree_role?, "admin")
        @blog_entry = Spree::BlogEntry.find_by_permalink!(params[:slug])
      else
        @blog_entry = Spree::BlogEntry.visible.find_by_permalink!(params[:slug])
      end
      @blog_entry.view!
      @title = @blog_entry.title
      #random a taxon in list taxon
      @taxon = @blog_entry.taxons.offset(rand(@blog_entry.taxons.count)).first
      #@searcher = build_searcher(params.merge(taxon: @taxon.id, include_images: true))
      #@products = @searcher.retrieve_products.order("spree_products.score desc, spree_products.updated_at desc")
      @taxonomies = current_store.taxonomies.includes(root: :children)
      @related_products = current_store.products.joins(:taxons).where(Taxon.table_name => { :id => @taxon.id }).order("spree_products.score desc, spree_products.updated_at desc").limit(4) if @taxon.present?

    end

    private
      def init_pagination
        @pagination_page = params[:page].to_i > 0 ? params[:page].to_i : 1
        @pagination_per_page = params[:per_page].to_i > 0 ? params[:per_page].to_i : 5
      end
  end
end