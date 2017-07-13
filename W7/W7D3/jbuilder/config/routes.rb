Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :guests do
      resources :gifts
    end
    resources :gifts
    resources :parties
  end
end
