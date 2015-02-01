FirstApp::Application.routes.draw do

  # ATTENRION! The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # Example resource route (maps HTTP verbs to controller actions automatically):
  # resources :products
  
  resources :users do
    resources :uvps do
      post :update_inline_content, on: :collection
    end
  end
  resources :uvps

  resources :sessions, only: [:new, :create, :destroy]

  # MÜLL
  #resources :microposts, only: [:create, :destroy]
  resources :microposts do
    post :update_row_order, on: :collection
  end

  # You can have the root of your site routed with "root"
  root  'static_pages#home'

  # Example of regular route:
  # get 'products/:id' => 'catalog#view'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/impressum', to: 'static_pages#impressum', via: 'get'
  match '/news', to: 'static_pages#news', via: 'get'
  
  #match '/users/update_inline_content', to: 'uvps#update_inline_content', via: 'post'
 

  # ===============
  # Useful examples
  # ===============
  #
  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase
  #
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
  #
  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end
  #
  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  #
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable
  #
  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
