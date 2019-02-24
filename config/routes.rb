Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get :nasa, to: 'nasa#show'
      post :users, to: 'users#create'
      get :favorites, to: 'favorites#index'
      post :favorites, to: 'favorites#create'
      delete :favorites, to: 'favorites#delete'

    end
  end

end
