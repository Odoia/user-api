Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  post 'api/v1/user' => 'api/v1/user#create'
  get 'api/v1/user' => 'api/v1/user#index'
end
