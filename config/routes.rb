Rails.application.routes.draw do
  devise_for :users

  scope module: :web do
    resources :proponents, except: :show
  end
end
