Rails.application.routes.draw do
  devise_for :users
  scope module: :web do
    resources :proponents, except: :show
    get 'inss_calculator', controller: :inss_calculators, action: :calculate

    root to: 'proponents#index'
  end
end