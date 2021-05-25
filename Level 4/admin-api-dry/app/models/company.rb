#require 'dry-struct'
#
#class Company <  Dry::Struct
# module Types
#    include Dry::Types(default: :nominal)
#  end
#  attribute :id, Types::Integer.optional
#  attribute :name, Types::String
#end
class Company < ApplicationRecord
  has_many :employee, class_name: "Employee",foreign_key: "companies_id"
end
