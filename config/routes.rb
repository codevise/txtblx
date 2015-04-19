Txtblx::Engine.routes.draw do
  resources :textblocks, only: [:update]
end
