Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: %i(index new create show)
  resources :subs, except: %i(destroy)

  resource :session, only: %i(create destroy new)
end
