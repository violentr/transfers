Rails.application.routes.draw do
  resources :users, only: [] do
    resources :transfers
  end

  post '/users/register', controller: 'users', action: 'register'
  post '/users/login', controller: 'users', action: 'login'
  #
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
