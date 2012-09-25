Bconnected::Application.routes.draw do
  resources :groups

  devise_for :users

  get "home/index"
  
  resources :user_profiles do
    collection do
      get 'profile_basic/:user_id', :action => 'profile_basic'
      get 'email_add_form/:user_id', :action => 'email_add_form'
      get 'connect_with_form/:user_id', :action => 'connect_with_form'
			get 'invite_contacts_form/:user_id', :action => 'invite_contacts_form'
			post 'show_bconnected_contacts/:user_id', :action => 'show_bconnected_contacts'
			post 'enter_password_to_connect/:user_id', :action => 'enter_password_to_connect'
			post 'enter_password_to_invite/:user_id', :action => 'enter_password_to_invite'
			post 'show_email_contacts/:user_id', :action => 'show_email_contacts'
      put 'email_add/:user_id', :action => 'email_add'
      post 'save_skills', :action => 'save_skills'
      get 'select_skills', :action => 'select_skills'
    end
  end
  
  resources :connections
  
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
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
