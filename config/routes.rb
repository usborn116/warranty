Rails.application.routes.draw do
  get 'room_items/new'
  get 'room_items/create'
  get 'room_items/edit'
  get 'room_items/update'
  get 'room_items/destroy'
  resources :items do
    get 'warranties', on: :member
  end
  resources :rooms
  devise_for :users
  root to: "items#index"
end
