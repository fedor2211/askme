Rails.application.routes.draw do
  root to: 'questions#index'

  resources :users, only: %i[new create]

  resource :session, only: %i[new create destroy]
  
  resources :questions do
    put 'hide', on: :member
  end
end
