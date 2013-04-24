AcrossEc::Application.routes.draw do

  resources :deadlines


  get "registration_confirmation/new"

  get "password_resets/new"

  get "pages/home"

  get "pages/about"

  get "pages/contact"

  get "pages/privacy"
  
  get "pages/question"

  root :to => 'pages#home'
 
  match '/loginasregistrar', :to => 'sessions#new'
  match '/loginasstudent', :to => 'sessions_students#new'
  match '/registrarlogout', :to => 'sessions#destroy'
  match '/studentlogout', :to => 'sessions_students#destroy'
  match '/applications/:id/approve', :to => 'applications#approve'
  match '/applications/:id/decline', :to => 'applications#decline'
  match '/students/:id/resend_confirmation', :to => 'students#resend_confirmation'
  match '/login', :to => 'pages#login'
  match '/confirm/:id/:code', :to => 'students#confirm_account'

  resources :universities
  resources :schedules
  resources :sessions
  resources :registrars
  resources :students
  resources :sessions_students
  resources :applications
  resources :password_resets


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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
