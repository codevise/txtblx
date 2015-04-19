Rails.application.routes.draw do

  devise_for :users
  mount Txtblx::Engine => "/txtblx"

  root to: 'dummies#index'
end
