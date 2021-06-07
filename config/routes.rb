Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :campaigns do
        resources :donations, only: [:create]
      end
    end
  end
end
