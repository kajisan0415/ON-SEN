Rails.application.routes.draw do
devise_for :admin, :controllers => {
    :registrations => 'admin/registrations',
    :sessions => 'admin/sessions'
  }

  devise_for :users, :controllers => {
    :registrations => 'public/users/registrations',
    :sessions => 'public/users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :articles
  end

  scope module: :public do
    resources :articles do
      resource :favorites, only: [:create, :destroy]
      resource :stamps, only: [:create, :destroy]
    end
  end

  root to: "public/homes#top"
  get "/about" => "public/homes#about"

end
