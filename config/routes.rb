Rails.application.routes.draw do
  resources :warranty_cards
  resources :items
  resources :rooms
  devise_for :users
  root to: "items#index"
end
