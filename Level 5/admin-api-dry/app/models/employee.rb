

class Employee   < ApplicationRecord
  belongs_to :tag_type, class_name: "TagType",foreign_key: "project"
  belongs_to :tag_type, class_name: "TagType",foreign_key: "country"
  belongs_to :tag_type, class_name: "TagType",foreign_key: "role"
  belongs_to :company, class_name: "Company",foreign_key: "companies_id"
  acts_as_paranoid
end
