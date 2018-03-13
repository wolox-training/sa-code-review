Rails.application.routes.draw do
  devise_for :users
  get 'repositories/github', to: 'repositories#github'
  get 'repositories/github_gists', to: 'repositories#github_gists'
  get 'weather/temperature', to: 'weather#temperature'

  resources :users, only: [:index, :show, :edit, :update] do
    put :update_twitter_settings
    get :twitter_timeline
  end
  resources :posts do
    post :like
  end
  get 'featured_posts', to: 'posts#featured'
end
