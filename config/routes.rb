Rails.application.routes.draw do
  root to: 'reads#index'
  namespace :api do
    namespace :v1 do
      resources :reads, only: [:create, :index]
    end
  end
end
