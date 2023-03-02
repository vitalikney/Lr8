Rails.application.routes.draw do
  root 'calc#input' # Запускает по умолчанию
  get 'calc/view'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
