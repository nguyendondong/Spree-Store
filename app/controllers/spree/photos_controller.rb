module Spree
  class PhotosController < Spree::StoreController
    before_filter :authenticate_actions, :except => [:index, :show]

    def destroy
      @photo = Photo.find_by_id(params[:id])
      @album = @photo.album

      set_cover = false
      if @album.cover_photo == @photo
        set_cover = true
      end

      @photo.destroy

      if set_cover && @album.photos.first.present?
        @album.update_attribute(:cover_photo_id, @album.photos.first.id)
      end
    end

    private

    def authenticate_actions
      redirect_to "/login" if spree_current_user.blank?
    end
  end
end
