module Spree
  class AlbumsController < Spree::StoreController
    before_filter :authenticate_actions, :except => [:index, :show, :like, :unlike]

    def index
      @albums = Album.all
      @index = true
    end

    def show
      @album = Album.find_by_tag(params[:id])
      @album.update_attribute(:views, @album.views + 1)
      @user = @album.user
      @url = request.original_url
    end

    def new
      @album = spree_current_user.albums.new
    end

    def create
      @album = spree_current_user.albums.create(album_params)
      @album.add_photos(params[:album][:photos]) if params[:album][:photos].present?
      if @album.product_id.blank?
        flash.now[:error] = Spree.t("albums.invalid_product_url")
        render :edit
      else
        flash[:success] = Spree.t("albums.create_success")
        cookies[:album_url_share] = "http://donghoxteen.com#{album_path(@album)}"
        respond_to do |format|
          format.html { redirect_to @album, notice: 'album was successfully created.' }
          format.json { render :json => @album }
        end
      end
    end

    def edit
      @album = spree_current_user.albums.find_by_tag(params[:id])
      if @album.present?
        @photos = @album.photos
      else
        redirect_to "/my-albums"
      end
    end

    def update
      @album = spree_current_user.albums.find_by_tag(params[:id])
      @album.update_attributes(album_params)
      @album.add_photos(params[:album][:photos]) if params[:album][:photos].present?
      if @album.product_id.blank?
        flash.now[:error] = Spree.t("albums.invalid_product_url")
        render "edit"
      else
        flash[:success] = Spree.t("albums.update_success")
        redirect_to edit_album_path(@album)
      end
    end

    def destroy
      @album = spree_current_user.albums.find_by_tag(params[:id])
      @album.destroy if @album.present?
      redirect_to "/my-albums"
    end

    def set_cover
      @album = spree_current_user.albums.find_by_id(params[:id])
      if @album.present?
        @album.update_attribute(:cover_photo_id, params[:photo_id])
      end
    end

    def like
      @album = Spree::Album.find_by_tag(params[:id])
      @album.update_attribute(:like_count, @album.like_count + 1) if @album.present?
      render nothing: true
    end

    def unlike
      @album = Spree::Album.find_by_tag(params[:id])
      if @album.present?
        like_count = (@album.like_count - 1 >= 0) ? (@album.like_count - 1) : 0
        @album.update_attribute(:like_count, like_count)
      end
      render nothing: true
    end

    private

    def authenticate_actions
      redirect_to "/login" if spree_current_user.blank?
    end

    def album_params
      params[:album].permit(:name, :description, :product_url)
    end
  end
end
