Rails.application.routes.draw do

  resources :balances

  concern :sociable do
    resources :paiements
  end

  resources :fournisseurs

  resources :achats do
    resources :alignes
    concerns :sociable
  end

  resources :boutiques
  resources :clients

  resources :ventes do
    resources :ventelignes
    concerns :sociable
  end

  resources :prestations do
    resources :prestation_attachments
    resources :prestationlignes
    concerns :sociable
    collection do
         get 'image'
    end
  end

  resources :tcoffres

  resources :coffres

  devise_for :users

  resources :banques do
  resources :tbanques
  end

  resources :employes

  resources :depenses
  resources :categoriedeps

  resources :stocks

  resources :articles
  resources :cadres
  resources :formatphotos

  get 'welcome/home'
  root 'welcome#home'

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
