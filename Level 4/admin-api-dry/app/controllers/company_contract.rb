# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require "dry-validation"

class CompanyContract < Dry::Validation::Contract
  params do
    #required(:id).value(:integer)
    required(:name).value(:string)
  end
  rule( :name ) do
    key.failure('Failed, Company already created') if Company.where(name: values[:name]).exists?
  end
end

