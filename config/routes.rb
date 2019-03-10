Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'driver#new'

  get    '/',   to: 'driver#new'
  post   '/',   to: 'driver#create'

  get   '/ready',   to: 'driver#ready'

  post '/sorted', to: 'driver#sorted'

  namespace :api do
    namespace :v1 do
      post :sorting_request
    end
  end
end
