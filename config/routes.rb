MathHelpQueue::Application.routes.draw do
  root({:to => "sessions#login"})
  get("sessions/login", :to => "sessions#login")
  post("sessions/login_attempt", :to => "sessions#login_attempt")
  get("sessions/home", :to => "sessions#home")
  post("sessions/home", :to => "sessions#home")
  post("sessions/logout", :to => "sessions#logout")
  get("students/add_course", :to => "students#add_course")
  post("students/_add_course_button", :to => "students#add_course_button")
  post("sessions/settings", :to => "sessions#settings")
  post("students/get_help", :to => "students#get_help")
  get("admin/edit_user_permissions", :to => "admin#edit_user_permissions")
  post("admin/_edit_user_permissions_button", :to => "admin#edit_user_permissions_button")
  post("sessions/edit_admin", :to => "sessions#edit_admin")
  #get "sessions/home"
  #get "sessions/profile"
  #get "sessions/setting"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root 'welcome#index'

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
end


