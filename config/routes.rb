Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :movies do
        resources :members, :controller => "movie_roles",only: [:create,:destroy]
      end

      post 'user_token' => 'user_tokens#create'
    end
  end
end
