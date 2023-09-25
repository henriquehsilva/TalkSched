Rails.application.routes.draw do
  root "api/v1/talks#index"

  namespace :api do
    namespace :v1 do
      resources :tracks
      resources :talks do
        collection do
          post :create_from_file
        end
      end
    end
  end
end
