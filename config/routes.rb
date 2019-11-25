Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/find', to: 'query#show'
        get '/find_all', to: 'query#index'
        get '/random', to: 'random#show'
        get '/:id/items', to: 'items#index'
        get '/:id/invoices', to: 'invoices#index'
        get '/most_revenue', to: 'revenue#index'
      end
      resources :merchants, only: [:index, :show]

      namespace :customers do
        get '/find', to: 'query#show'
        get '/find_all', to: 'query#index'
        get '/random', to: 'random#show'
        get '/:id/invoices', to: 'invoices#index'
        get '/:id/transactions', to: 'transactions#index'
      end
      resources :customers, only: [:index, :show]

      namespace :invoices do
        get '/find', to: 'query#show'
        get '/find_all', to: 'query#index'
        get '/random', to: 'random#show'
        get '/:id/transactions', to: 'transactions#index'
        get '/:id/invoice_items', to: 'invoice_items#index'
        get '/:id/items', to: 'items#index'
        get '/:id/customer', to: 'customer#show'
        get '/:id/merchant', to: 'merchant#show'
      end
      resources :invoices, only: [:index, :show]
    end
  end
end
