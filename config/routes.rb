Rails.application.routes.draw do
  #get 'buildings/:building_id/rooms', to: 'rooms#index', as: :rooms
  #get 'buildings/:building_id/rooms/:id', to: 'rooms#show', as: :room
  resources :buildings, only: [:index] do
    resources :rooms, only: [:index, :show]
  end
  root to: 'buildings#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
