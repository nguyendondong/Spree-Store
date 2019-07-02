class Spree::Admin::StoreTemplatesController < Spree::Admin::BaseController
  layout "/spree/layouts/admin"
  before_action :store_template, only: [:edit, :update, :show, :destroy]
  def index
    # @store_templates = StoreTemplate.all
    @get_template = Dir.entries('app/views_template').select {|entry| File.directory? File.join('app/views_template',entry) and !(entry =='.' || entry == '..') }
    # @template_images = Dir.glob("app/assets/images/template_thumb/*.jpg")

  end

  def show
  end 

  def new
    #@store_template = StoreTemplate.new
  end

  def edit
  end

  def create
    # @store_template = StoreTemplate.new(store_template_params)
    # if @store_template.save
    #     redirect_to admin_store_templates_path
    # else
    #     render 'new'
    # end 
  end

  def update
    # if @store_template.update(store_template_params)
    # redirect_to admin_store_templates_path
    # else
    #   render 'edit'
    # end
  end

  def destroy
    # @store_template.destroy
    # redirect_to admin_store_templates_path
  end

  private
  def store_template_params
      params.require(:store_template).permit(:name, :thumb)
  end

  def store_template
    @store_template = StoreTemplate.find(params[:id])
  end
end