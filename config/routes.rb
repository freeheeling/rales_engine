Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/find', to: 'query#show'
        get '/find_all', to: 'query#index'
        get '/random', to: 'random#show'
        get '/:id/items', to: 'items#index'
        get '/:id/invoices', to: 'invoices#index'
      end
      resources :merchants, only: [:index, :show]
      resources :customers, only: [:index]
    end
  end
end
