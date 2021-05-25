Rails.application.routes.draw do
  get "/companies", to: "company#index"
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
end
