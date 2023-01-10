Rails.application.routes.draw do
  root to: 'questions#index'

  resources :users, except: %i[index], param: :nickname

  resource :session, only: %i[new create destroy]

  resources :questions do
    put "hide", on: :member
    get "hashtag/:name", on: :collection, to: "questions#hashtag"
  end
end
