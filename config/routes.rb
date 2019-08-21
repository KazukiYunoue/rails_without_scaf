Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :entries
  # TODO: resources blog only index, new, create, edit, update, destroy
  # TODO: nested resources entries
  # TODO: nested resources comments only create, destroy, approve
end
