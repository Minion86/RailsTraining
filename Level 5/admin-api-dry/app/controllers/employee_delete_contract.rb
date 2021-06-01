# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.


class EmployeeDeleteContract < Dry::Validation::Contract
  params do
    required(:id).value(:integer)
    required(:type).value(:string)
  end
  rule( :id ) do
    if (Employee.where(id: values[:id]).empty?)
      key.failure('Failed, Employee not found') 
    end
  end
 
end
