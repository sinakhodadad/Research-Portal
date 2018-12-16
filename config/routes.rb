Rails.application.routes.draw do

  resources :contents
    get '/myProfile' => 'profiles#my_profile'
    resources :profiles
    resources :user_publications
    resources :people_projects
    devise_for :users, :controllers => {:registrations => "registrations"} do
        get '/users/sign_out' => 'devise/sessions#destroy'

    end

    scope '/admin' do
        scope '/members' do
            match '/update/:id', to: 'admin#update_member', :as => :admin_update_member, via: [:patch, :put, :post]
            match '/edit/:id' => 'admin#edit_member', :as => :admin_edit_member, via: [:get]
        end
        match '/members' => 'admin#members', :as => :admin_members, via: [:get]
        
  
    end

    resources :user_contexts
    resources :contexts
    resources :add_users
    resources :sponsors
    
    resources :people_projects
    resources :publications
    resources :projects
    resources :journals
    resources :news
    root "news#index"

    resources :news
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
