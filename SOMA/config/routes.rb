Rails.application.routes.draw do
  root "static_pages#home"

  resources :users, except: [:index]
  resources :students, except: [:index]
  resources :doctors, except: [:index]
  resources :courses
  resources :sessions, only: [:new, :create, :destroy] 
  resources :documents
  resources :questions
  resources :videos

  match "/users", to: "doctors#index", via: "get", as: "all_users"
  match "/signup", to: "sessions#new", via: "get" 
  match "/signin", to: "sessions#new", via: "get" 
  match "/signout", to: "sessions#destroy", via: "delete", as: "signout"
  match "/deacivate/:id", to: "users#deactivate", via: "get", as: "deactivate"
  match "/activate/:id", to: "users#activate", via: "get", as: "activate"
  match "/:controller/:id/edit/login", to: "students#edit_login", via: "get", as: "edit_login"
  match "/:controller/:id/edit/login", to: "students#update_login", via: "patch", as: "update_login"
  match "/course/:id/join", to: "courses#join", via: "post", as: "join"
  match "/course/:id/disjoin", to: "courses#disjoin", via: "post", as: "disjoin"
  match "/course/students", to: "courses#enrolled_students", via: "get", as: "enrolled_students"
  
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
