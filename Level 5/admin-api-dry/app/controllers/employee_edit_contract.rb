# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.


class EmployeeEditContract < Dry::Validation::Contract
  params do
    required(:id).value(:integer)
    required(:name).value(:string)
    required(:company).value(:integer)
    required(:project).value(:integer)
    required(:country).value(:integer)
    required(:role).value(:integer)
  end
  rule( :company ) do
    key.failure('Failed, Company not found') if Company.where(id: values[:company]).empty?
  end
  rule( :project ) do
    key.failure('Failed, Project not found') if TagType.where(id: values[:project]).empty?
  end
  rule( :country ) do
    key.failure('Failed, Country not found') if TagType.where(id: values[:country]).empty?
  end
  rule( :role ) do
    key.failure('Failed, Role not found') if TagType.where(id: values[:role]).empty?
  end
  rule( :id ) do
    if (Employee.where(id: values[:id]).empty?)
      key.failure('Failed, Employee not found') 
    end
  end
 
end
