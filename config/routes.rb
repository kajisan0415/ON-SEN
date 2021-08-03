Rails.application.routes.draw do
  devise_for :admin, :controllers => {
    :registrations => 'admin/registrations',
    :sessions => 'admin/sessions',
  }

  devise_for :users, :controllers => {
    :registrations => 'public/users/registrations',
    :sessions => 'public/users/sessions',
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :articles, only: [:show, :destroy] do
    end
  end

  scope module: :public do
    resources :blogs, only: [:new, :create, :edit, :update, :show, :destroy]
    resources :users, only: [:show, :edit, :update] do
      get :favorites, on: :member
      get :calender, on: :member
    end
    resources :articles do
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
      resource :stamps, only: [:create, :destroy]
    end
    get "timeline" => "comments#timeline"
    get "search" => "articles#search"
    get "ranking" => "articles#ranking"
    get "mapping" => "articles#mapping"
    get "googlemap/:prefecture" => "articles#googlemap", as: "map_prefecture"
  end

  root to: "public/homes#top"
  get "/about" => "public/homes#about"
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/users/sessions#new_guest'
  end
  
end