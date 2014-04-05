Uniformity::Application.routes.draw do
  resources :stock_orders

  resources :expertises

  resources :kit_staffs

  resources :staff_measurements

  resources :uniform_stock_issues

  resources :uniform_stock_receiveds

  resources :uniform_stocks do
    collection do
      get 'request_report'
      get 'outstanding_report'
      get 'outstanding2_report'
	  get 'request_detail'
	  get 'outstanding_detail'
    end
  end
  
  resources :uniform_stocks do
	collection do
		match 'outstanding_detail' => 'uniform_stocks#outstanding_detail', via: [:get, :post], as: :search1
		match 'request_detail' => 'uniform_stocks#request_detail', via: [:get, :post], as: :search2
		match 'outstanding2_report' => 'uniform_stocks#outstanding2_report', via: [:get, :post], as: :search3
	end
  end

  resources :kit_uniforms

  resources :kits

  resources :uniform_items
  
  resources :staffs do
    collection do
      get 'kit_list'
    end
  end
  
  resources :staffs do 
    collection { post :import }
  end
  
  match '/public/excel_format/staff_excel.xls', to: 'staffs#download_excel_format', via: 'get', target: '_self'
  match 'import_excel', to:'staffs#import_excel', via: 'get'
 
  resources :ranks
  
  resources :units
  
  resources :unit_types
  
  resources :positions
  
  resources :companies

  devise_for :users
  resources :users
  root  'static_pages#home'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  
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
