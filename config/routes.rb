Rails.application.routes.draw do
  root 'cocktails#index'
  resources :cocktails do
    resources :doses, only: [:create, :edit, :update, :destroy], shallow: true
    resources :reviews, only: [:create]
  end
  mount Attachinary::Engine => "/attachinary"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
