Rails.application.routes.draw do

  resources :journaliers
  #get 'journaliers/index'

  #get 'journaliers/show'

  resources :retourelogs

  resources :optionretoures

  resources :livraisonlogs

  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', sign_up: 'register' }
=begin
  devise_scope :user do
    get :register, :to => 'devise/registrations#new'
    post :register, :to => 'devise/registrations#create'
    put :update_password, :to => 'devise/my_registrations#update'
    get :login, :to => 'devise/sessions#new'
    get :login, :to => 'devise/sessions#new', :as => :new_copasser_session
    post :login, :to => 'devise/sessions#create'
    delete :logout, :to => 'devise/sessions#destroy'
  end
=end

  resources :monetaires

  resources :balances

  concern :sociable do
    resources :paiements
  end
  resources :paiements

  concern :gestion do
    member do
      post :valider
      post :invalider
    end
  end

  concern :gestion1 do
    collection do
      get :edit_multiple
      put :update_multiple
      post :livrets
      post :nlivrets
    end
  end

  concern :gestion_livraison do
    member do
      post :livret
      post :nlivret
    end
  end

  resources :fournisseurs do
    concerns :sociable
  end

  resources :achats do
    concerns :gestion
    resources :alignes do
      concerns :gestion1
      concerns :gestion_livraison
    end
    concerns :sociable
  end

  resources :boutiques
  resources :clients do
    concerns :sociable
  end

  resources :ventes do
    concerns :gestion
    resources :ventelignes do
      concerns :gestion1
      concerns :gestion_livraison
    end
    concerns :sociable
  end

  resources :prestations do
    concerns :gestion
    resources :prestation_attachments
    resources :prestationlignes do
      concerns :gestion1
      concerns :gestion_livraison
    end
    concerns :sociable
    collection do
         get 'image'
    end
  end

  resources :tcoffres

  resources :coffres


  resources :banques 
  resources :tbanques

  resources :employes

  resources :depenses
  resources :categoriedeps

  resources :stocks

  resources :articles do
=begin
    collection do
    match 'search' => 'article#search', via: [:get, :post], as: :search
  end
=end
  end
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
