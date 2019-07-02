module Spree
    module Admin
      class LeadListsController < Spree::Admin::BaseController
          def create
            @lead_list = LeadList.create(lead_list_params)
            respond_to do |format|
              format.html { render :text => "ok" }
              format.json { render :json => @lead_list
              }
              
            end
          end
          private
          def lead_list_params
            params.require(:lead_list).permit(:name)
          end
      end
    end
  end