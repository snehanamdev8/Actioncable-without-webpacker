Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    authenticated :user do
      root to: redirect('/rooms')
    end
    unauthenticated :user do
      root to: redirect('/users/sign_up'), as: :unauthenticated_root
    end
  end

  resources :rooms
  resources :messages

  mount ActionCable.server => '/cable'
end
