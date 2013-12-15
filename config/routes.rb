MathHelpQueue::Application.routes.draw do
  root({:to => "sessions#login"})
  get("sessions/login", :to => "sessions#login")
  post("sessions/login_attempt", :to => "sessions#login_attempt")
  get("sessions/home", :to => "sessions#home")
  post("sessions/home", :to => "sessions#home")
  post("sessions/logout", :to => "sessions#logout")
  post("sessions/settings", :to => "sessions#settings")
  post("sessions/edit_admin", :to => "sessions#edit_admin")
  #get "sessions/home"
  #get "sessions/profile"
  #get "sessions/setting"
  
  get("students/get_help", :to => "students#get_help")
  post("students/get_help", :to => "students#get_help")
  get("students/add_course", :to => "students#display_courses")
  post("students/add_course", :to => "students#add_course")
  post("students/_add_course_button", :to => "students#add_course_button")
  
  get("admin/admin_home", :to => "admin#admin_home")
  post("admin/admin_home", :to => "admin#admin_home")
  get("admin/change_perspective", :to => "admin#change_perspective")
  post("admin/change_perspective", :to => "admin#change_perspective")
  get("admin/ta_perspective", :to => "admin#ta_perspective")
  post("admin/ta_perspective", :to => "admin#ta_perspective")
  get("admin/student_perspective", :to => "admin#student_perspective")
  post("admin/student_perspective", :to => "admin#student_perspective")
  get("admin/manage_courses", :to => "admin#manage_courses")
  post("admin/manage_courses", :to => "admin#manage_courses")
  get("admin/add_course", :to => "admin#add_course")
  post("admin/add_course", :to => "admin#add_course")
  get("admin/delete_course", :to => "admin#delete_course")
  post("admin/delete_course", :to => "admin#delete_course")
  get("admin/edit_user_privileges", :to => "admin#edit_user_privileges")
  post("admin/edit_user_privileges", :to => "admin#edit_user_privileges")
  post("admin/edit_admin", :to => "admin#edit_admin")
  post("admin/edit_ta", :to => "admin#edit_ta")
  post("admin/edit_student", :to => "admin#edit_student")
  
  
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


