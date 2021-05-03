Rails.application.routes.draw do
  root "company#index"

  post "/companies", to: "company#index"
  get "/company/:id", to: "company#show", as: 'company'
  get "/company/new", to: "company#new", as: 'new_company'
  post "/company(.:format)", to: "company#create", as: 'company_create'
  get "/company/:id/edit", to: "company#edit", as: 'edit_company'
  patch "/company/:id(.:format)", to: "company#update"
  delete "/company/:id(.:format)", to: "company#destroy"
  
  post "/books", to: "book#index"
  get "/book/:id", to: "book#show", as: 'book'
  get "/book/new/:company_id", to: "book#new", as: 'new_book'
  post "/book/:company_id(.:format)", to: "book#create", as: 'book_create'
  get "/book/:id/edit", to: "book#edit", as: 'edit_book'
  patch "/book/:id(.:format)", to: "book#update"
  delete "/book/:id(.:format)", to: "book#destroy"
  
  post "/games", to: "game#index"
  get "/game/:id", to: "game#show", as: 'game'
  get "/game/new/:company_id", to: "game#new", as: 'new_game'
  post "/game/:company_id(.:format)", to: "game#create", as: 'game_create'
  get "/game/:id/edit", to: "game#edit", as: 'edit_game'
  patch "/game/:id(.:format)", to: "game#update"
  delete "/game/:id(.:format)", to: "game#destroy"
end
