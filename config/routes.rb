Rails.application.routes.draw do
  get 'admin' => 'admin#index'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :support_requests, only: %i[ index update ]
  resources :users
  resources :products
  get 'questions', to: 'store#questions', as: 'questions'
  get 'contact', to: 'store#contact', as: 'contact'

  scope '(:locale)', locale: /en|es/ do
    resources :orders
    resources :line_items
    resources :carts
    root 'store#index', as: 'store_index', via: :all
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
