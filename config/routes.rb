Rails.application.routes.draw do
  root 'home#index'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :cuisines
      resources :reviews
      resources :restaurants
    end
  end
end
