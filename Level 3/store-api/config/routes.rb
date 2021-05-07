Rails.application.routes.draw do
  get "/companies", to: "company#index"
  get "/company/:id", to: "company#show", as: 'company'
  post "/createCompany(.:format)", to: "company#create", as: 'company_create'
  post "/updateCompany/:id(.:format)", to: "company#update"
  post "/destroyCompany/:id(.:format)", to: "company#destroy"
  
  get "/books", to: "book#index"
  get "/book/:id", to: "book#show", as: 'book'
  post "/createBook/:company_id(.:format)", to: "book#create", as: 'book_create'
  post "/updateBook/:id(.:format)", to: "book#update"
  post "/destroyBook/:id(.:format)", to: "book#destroy"
  
  get "/games", to: "game#index"
  get "/game/:id", to: "game#show", as: 'game'
  post "/createGame/:company_id(.:format)", to: "game#create", as: 'game_create'
  post "/updateGame/:id(.:format)", to: "game#update"
  post "/destroyGame/:id(.:format)", to: "game#destroy"
end
