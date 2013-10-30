MeYodaApp::Application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # Root
  root to: "welcome#index"
  
  #Resources
  resources :card_types
  resources :cards
  resources :users
  resources :sales

  
  # Users sessions control routes
  match "signup" => "users#new", via: :get
  match "login" => "sessions#login", via: :get
  match "logout" => "sessions#logout", via: :get
  match "home" => "sessions#home", via: :get
  match "buy" => "welcome#buy", via: :get

  # Authentication (http://www.sitepoint.com/rails-userpassword-authentication-from-scratch-part-i/)
  get ':controller(/:action(/:id))'   # This is used for login_attempt in sessions controller
  post ':controller(/:action(/:id))'
  
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
