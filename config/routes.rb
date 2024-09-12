Rails.application.routes.draw do
  get 'test/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post 'generate_component', to: 'test#generate_component'
end
