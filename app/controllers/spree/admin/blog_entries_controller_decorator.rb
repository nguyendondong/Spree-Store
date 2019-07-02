module Spree
  module Admin
    BlogEntriesController.class_eval do
      before_filter :load_data, :except => :index

      def create
        if params[:blog_entry][:taxon_ids].present?
          params[:blog_entry][:taxon_ids] = params[:blog_entry][:taxon_ids].split(',')
        end
        @blog_entry = BlogEntry.create(permitted_params)
        redirect_to admin_blog_entries_path
      end

      def update
        if params[:blog_entry][:taxon_ids].present?
          params[:blog_entry][:taxon_ids] = params[:blog_entry][:taxon_ids].split(',')
        end
        @blog_entry = @blog_entry.update_attributes(permitted_params)
        redirect_to edit_admin_blog_entry_path(@blog_entry)
      end

      private

      def permitted_params
        params.require(:blog_entry).permit!
      end

      def load_data
        @taxons = Taxon.order(:name)
      end
    end
  end
end