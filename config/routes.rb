Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts, only: [:index, :show, :create, :update, :destroy] do
    resources :comments, only: [:index, :create]
    # Nesting routes: shallow - to reduce code
  end

  resources :comments, only: [:show, :update, :destroy]
  # exemple: resources :posts, param: :post_id, only: [:index, :show, :create, :update, :destroy]

  # exemple: get 'posts/:pizza', to: 'posts#show' to rename it like we want

  root "home#index"
end
