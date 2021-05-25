class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.references :companies, index: true, foreign_key: true
      t.references :tag_types, index: true, foreign_key: true
      t.timestamps
    end
  end
end
