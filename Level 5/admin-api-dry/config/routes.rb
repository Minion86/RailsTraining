Rails.application.routes.draw do
   devise_for :models,
               path: '',
               defaults: { format: :json },
               path_names: {
                 sign_in: 'login',
                 sign_out: 'logout',
                 registration: 'signup'
               },
               controllers: {
                 sessions: 'model/sessions',
                 registrations: 'model/registrations'
               }
  get "/companies", to: "company#index"
  get "/companiesPaginated(.:format)", to: "company#paginated"
  get "/company/:id", to: "company#show", as: 'company'
  post "/createCompany(.:format)", to: "company#create", as: 'company_create'
  post "/updateCompany/:id(.:format)", to: "company#update"
  post "/destroyCompany/:id(.:format)", to: "company#destroy"

  get "/employees", to: "employee#index"
  get "/employees_with_deleted", to: "employee#with_deleted"
  get "/employee/:id", to: "employee#show", as: 'employee'
  post "/createEmployee(.:format)", to: "employee#create", as: 'employee_create'
  post "/updateEmployee/:id(.:format)", to: "employee#update"
  post "/destroyEmployee/:id(.:format)", to: "employee#destroy"

  #post :auth, to: 'sessions#signin'
  #get  '/auth' => 'sessions#fetch'
end
