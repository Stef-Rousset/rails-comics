Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'
  resources :articles, except: :index do
    resources :comments, only: [:new, :create]
      collection do
        get :most_popular
      end
  end
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :articles, only: [ :index, :show ]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
