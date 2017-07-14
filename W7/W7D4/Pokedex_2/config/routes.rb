Rails.application.routes.draw do
  root to: 'static_pages#root'

  namespace :api, defaults: { format: :json } do
    resources :pokemon
    resources :pokemon do
      resources :items
    end
  end
end
