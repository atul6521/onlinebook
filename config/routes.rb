Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'users#index'
  resources :users
  resources :transactions
  resources :books do
    get 'book', to: 'transactions#book'
  end
   post "/hook" => "transactions#hook"
end
