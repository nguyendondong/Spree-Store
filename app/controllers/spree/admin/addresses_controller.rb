module Spree
    module Admin
      class AddressesController < Spree::Admin::BaseController
        def get_addresses
            @addresses = Address.where("firstname LIKE '%"+ params[:address_id] +"%' || alternative_phone Like '%" + params[:address_id] + "%'|| phone Like '%" + params[:address_id] +"%'").group(:phone).order(:firstname)
            respond_to do |format|
              format.html
              format.json { render :json => @addresses
               }
            end
        end
      end
    end
  end