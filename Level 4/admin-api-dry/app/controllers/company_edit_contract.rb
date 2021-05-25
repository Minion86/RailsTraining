# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.


class CompanyEditContract < Dry::Validation::Contract
  params do
    required(:id).value(:integer)
    required(:name).value(:string)
  end
  rule( :id ) do
    if (Company.where(id: values[:id]).empty?)
      key.failure('Failed, Company not found') 
    end
  end
 
end
