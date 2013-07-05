Demo02::Application.routes.draw do

  match 'admin' => 'admin#index'
  namespace :admin do
    resources :books do
      collection do
        get 'add_page'
      end
    end
  end

  resources :books do
    collection do
      get 'all'
      get 'action01'
      get 'action02'
      get 'multi_new'
      post 'save_multi'
      get 'add_author'
      post 'save_author'
    end
  end

  resources :doctors

  resources :patients do
    get "method_one"
    member do
      get "method_two"
    end
    collection do
      get "method_three"
    end
  end

  resources :appointments

  resources :profiles

  match "xyz_one" => "articles#my_action2", :as => "my_action"
  match "articles/user/:user_id" => "articles#index", :as => 'user_articles'
  match "articles/tag/:tag_name" => "articles#index", :as => 'articles_tag'
  resources :articles do
    resources :comments
  end

  devise_for :users

  match "/about" => "home#about", :as => "about"

  root :to => "home#index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
