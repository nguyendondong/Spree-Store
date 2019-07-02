Rails.application.routes.draw do

  # This line mounts Spree's routes at the root of your application.
  # This means, any requests to URLs such as /products, will go to Spree::ProductsController.
  # If you would like to change where this engine is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Spree relies on it being the default of "spree"
  resources :notifications do
    collection do
      post 'mark_all'
      get 'update_notification'    
    end
  end

  # resources :orders do
  #   resources :show
  # end

  mount Ckeditor::Engine => '/ckeditor'
  mount Spree::Core::Engine, :at => '/'
  Spree::Core::Engine.routes.append do
    namespace :admin do
      resources :stock_items
      resources :reports, :only => [:index] do
        collection do
          get :top_products
          post :top_products
          get :top_cities
          get :daily
          get :sale_performances
          get :returning_customer
          get :traffic_referrer
        end
      end
      resources :notifications
      resources :variants, :only => [:index] do
        member do 
          get :get_info
        end
      end
      resources :store_templates
      resources :sale_performances
      resources :leads 
      resources :leadlists
      resources :comments
      resources :notes
      resources :print_order_addresses
      resources :addresses do
        get :get_addresses
      end
      resources :lead_lists
      resources :products do
        member do
          get :recover
        end
        collection do
          get :search
        end
      end
      resources :sliders do
        resources :slider_images
      end
      resources :orders do
        member do
          post :transfer
          get :accept_transfer
        end

        resources :line_items do
          member do
            put :update_variant
          end
        end
      end
      get "unassigned" => "orders#index"
    end
    namespace :api, defaults: { format: 'json' } do
      resources :shipments, only: [:create, :update] do
        member do
          put :finish
        end
      end
    end
    get "admin/login" => "admin#login"
    get "my-albums" => "users#albums"
    resources :albums do
      member do
        post :set_cover
        post :like
        post :unlike
      end
    end

    resources :photos
    resources :users do
      collection do
        post :update_phone
      end
    end
    get "my-campaigns" => "users#campaigns"
    get "referred-orders" => "users#referred_orders"
    get "withdraw-money" => "users#withdraw_money"
    post "send-withdraw-money" => "users#send_withdraw_money"
    get "withdraw-money/success" => "users#success"

    get "/cung-chup-anh-xinh-rinh-qua-that-da" => "home#about_albums_competition"
    # get "sitemap.xml" => "home#sitemap", format: :xml, as: :sitemap
  end
  
  
  post "/update_cam_status" => "campaigns#update_status"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  resources :districts
  resources :comments
  resources :campaigns
  resources :pictures 
  resources :notifications do
    collection do
      post 'mark_all'
    end
  end

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
  # match '/404', to: 'home#index', via: :all

  Spree::Core::Engine.add_routes do
    
    resources :products do
      collection do
        get :search
        get :search_show
      end
    end
  end

end