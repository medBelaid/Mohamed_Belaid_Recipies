Rails.application.routes.draw do
  
  resources :recipes, :defaults => {format: :json} do
  	member do 
  		get 'favorite', to: 'recipes#upvote'
  	end
    resources :ingredients, :defaults => {format: :json}
  end
  devise_for :users
  root to: 'application#angular'
 
end
