Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html 
    root to: 'items#index'

    resources :items, only: [:new, :create, :show, :index]
    resources :item_images, only: [:create]

    resources :items do
      get :search,on: :collection
    end
end
  