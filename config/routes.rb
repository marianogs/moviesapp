Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :movies
      post 'user_token' => 'user_tokens#create'
    end
  end
end
