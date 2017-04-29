Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :recipe_reviews
  get 'user_sessions/new'

  resources :users
  resources :steep_instructions
  resource :user_sessions

  get 'welcome/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  get 'ingredients/complete_hash' => 'ingredients#complete_hash'

  # CRUD for ingriedients
  resources :ingredients

  # CRUD for recipes
  resources :recipes

  get 'about' => 'application#about'

  get 'logout' => "user_sessions#destroy"
  get 'login' => "user_sessions#new"
  # Example of regular route:

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  post 'upvote/:recipe_id' => "recipes#upvote", as: :upvote_recipe
  post 'downvote/:recipe_id' => "recipes#downvote", as: :downvote_recipe


  # Blog Routes
  get 'blog' => "posts#index", as: :blog
  resources :posts

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
