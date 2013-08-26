Chess::Application.routes.draw do

  devise_for :admins
  devise_for :users
  root :to => "home#index"
  resources :games do
    member do
      get :export
    end
  end

end
