

class TagType  < ApplicationRecord
   has_many :employee, class_name: "Employee",foreign_key: "project"
   has_many :employee, class_name: "Employee",foreign_key: "country"
   has_many :employee, class_name: "Employee",foreign_key: "role"
end

