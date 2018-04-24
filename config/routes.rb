Rails.application.routes.draw do
  root 'home#index'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :cuisines
      resources :reviews
      resources :restaurants do
        get '(:id)/reviews' => 'reviews#index_by_restaurant_id'
        resources :reviews, only: [:create]
      end
    end
  end
end
