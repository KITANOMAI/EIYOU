Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'kennko#index' 
  get 'kennko/index' => 'kennko#index' 
  get 'kennko/link' => 'kennko#link'

  get 'tweets/nyuuziki' => 'tweets#nyuuziki'
  get 'tweets/youziki' => 'tweets#youziki'
  get 'tweets/gakureiki' => 'tweets#gakureiki'
  get 'tweets/cyuugakusei' => 'tweets#cyuugakusei'
  get 'tweets/seinennki' => 'tweets#seinennki'
  get 'tweets/sounennki' => 'tweets#sounennki'
  get 'tweets/cyuunennki' => 'tweets#cyuunennki'
  get 'tweets/rounennki' => 'tweets#rounennki'
  get 'tweets/sports' => 'tweets#sports'
  get 'tweets/nennsinnki' => 'tweets#nennsinnki'

  resources :users, only: [:show]

  get 'tweets/:tweet_id/likes' => 'likes#create'
  get 'tweets/:tweet_id/likes/:id' => 'likes#destroy'
  
  resources :tweets do
    resources :likes, only: [:create, :destroy]
  
    collection do
      get "question1"
      get "question2"
      get "question3"
      get "result"
    end
  
    resources :comments, only: [:create] do
      resources :goods, only: [:create, :destroy]
    end
  end  


end
