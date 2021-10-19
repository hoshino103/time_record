Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to:  'records#index'
  resources :records, only: [:index,:create, :show, :update, :edit, :destroy] do
    collection do
      get 'search'
    end
  end
end
