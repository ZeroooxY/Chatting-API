Rails.application.routes.draw do
  post 'login', to: 'authentication#authenticate'
  get 'contacts', to: 'users#index'
  post 'signup', to: 'users#create'
  post 'messages', to: 'messages#create'
  get 'conversation', to: 'conversations#index'
  get 'viewchat', to: 'conversations#show'

  #validates_presence_of :body, :conversation_id, :user_id
  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end
end
