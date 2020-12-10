Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'
  resources :articles, except: :index do
    resources :comments, only: [:new, :create]
      collection do
        get :most_popular
      end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
