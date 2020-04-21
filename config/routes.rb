Rails.application.routes.draw do

  root to: 'static#index'

  resources :static, only: %i[index show]

end
