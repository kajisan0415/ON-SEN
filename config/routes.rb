Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :articles
  end

  scope module: :public do
    resources :articles
  end

  root to: "public/homes#top"
  get "/about" => "public/homes#about"

end
