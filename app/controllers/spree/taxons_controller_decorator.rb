module Spree
  TaxonsController.class_eval do

    def show
      @taxon = Taxon.find_by_permalink!(params[:id])
      return unless @taxon

      #@searcher = build_searcher(params.merge(taxon: @taxon.id, include_images: true))
      #@products = @searcher.retrieve_products.order("spree_products.score desc, spree_products.updated_at desc")
      @products = @taxon.products.order("spree_products.score desc, spree_products.updated_at desc").page(params[:page]).per(12)
      @taxonomies = current_store.taxonomies.includes(root: :children)
    end

    private
    def taxon_params
      params.require(:taxon).permit(Spree::PermittedAttributes.taxon_attributes + [:thumb])
    end


  end
end
