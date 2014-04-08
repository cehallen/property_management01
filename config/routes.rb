PropertyManagement01::Application.routes.draw do
  # resources :buildings
  resources :owners do
    resources :buildings, only: [:index, :new, :create, :update, :destroy, :show]
  end

  root to: "owners#index"
end

