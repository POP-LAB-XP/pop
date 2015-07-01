# -*- encoding : utf-8 -*-
Rails.application.routes.draw do

 get 'vetos/new'

 get 'vetos/create'

 get 'vetos/show'

 get 'static/termos_uso'

 get 'propostas/meus_apoios'

 resources :vetos, :only => [:show, :new, :create]

 post 'votos/create'

 #devise_for :users
  devise_for :users, controllers: { registrations: "users/registrations" }

 #devise_for :users, :controllers => { :registrations => "registrations" }
 #get 'interface/index'

 get 'static/index'

 #get 'static_pages/welcome'
 root 'static#welcome'

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
 # post "/propostas/:id/new_voto" => "propostas#new_voto"

 resources :propostas, :only => [:new, :create, :index]

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
