Rails.application.routes.draw do
  get '/', to: redirect('/posts')
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
