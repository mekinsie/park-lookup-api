Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      # get 'parks', to: 'parks#all'
      resources :states do
        resources :parks
      end
    end
  end
end
