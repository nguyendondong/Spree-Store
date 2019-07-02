class PicturesController < ApplicationController
    def destroy
        @picture = Picture.find_by_id(params[:id])
        p params[:id]
        respond_to do |format|
            if @picture.destroy
                format.json {render :json => {status: 'success'}}
            else
                format.json {render :json => {status: 'some error occur'}}
            end
        end
  
      end
  
      
    
end