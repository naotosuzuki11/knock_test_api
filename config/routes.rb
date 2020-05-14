Rails.application.routes.draw do

  # namespace :api do 
    resources :users
    post 'user_token' => 'user_token#create'
    post 'find_user' => 'users#find'
    root 'home#index'
    get 'auth' => 'home#auth'
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
