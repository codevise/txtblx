Rails.application.routes.draw do

  mount Txtblx::Engine => "/txtblx"

  root to: 'dummies#index'
end
