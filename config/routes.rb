Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :blogs, shallow: true, only: %i[index new create edit update destroy] do
    resources :entries do
      resources :comments, only: %i[create destroy] do
        patch :approve, on: :member
      end
    end
  end
end
