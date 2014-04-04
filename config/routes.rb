PropertyManagement01::Application.routes.draw do
  resources :buildings
  resources :owners

  root to: "buildings#index"
end
