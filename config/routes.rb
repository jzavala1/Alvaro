Rails.application.routes.draw do
  resources :channels

  resources :shippings

  resources :sales

  resources :clients

  root :to => "dashboard#index"
  
  devise_scope :user do
    get '/login' => "users/sessions#new"
    delete '/logout' => "users/sessions#destroy"
  end
  
  devise_for :users, controllers: { sessions: "users/sessions" }
  resources :users

  resources :brands

  resources :products do
    collection do 
      get "sku"
    end
  end

  resources :sections

  resources :sub_categories do
    get "sections"
  end

  resources :categories do
    get "sub_categories"
  end

  resources :orders do
    post "send_contract"
    post "send_confirmation"
    post "send_offer"
  end

  resources :suppliers do 
    get "show_products"
    get "show_orders"
    post "send_condition"
  end

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
end
