Rails.application.routes.draw do
  devise_for :users
  scope module: :web do
    resources :proponents, except: :show
    root to: 'proponents#index'
  end

  namespace :api do
    namespace :v1 do
      get 'inss_calculator', controller: :inss_calculators, action: :calculate
      resources :states, only: [] do
        resources :cities, only: :index
      end
    end
  end
end