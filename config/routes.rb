Rails.application.routes.draw do
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users do
  #   resources :activities, only: [:index, :create, :new]
  # end
  # resources :activities, only: [:destroy, :edit,:show, :update]Z

  resources :users do
    resources :activities do
      resources :steps, shallow: true
    end
    resources :notes
  end
end
