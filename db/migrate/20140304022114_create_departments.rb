class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.column :department_name, :string
      t.column :deleted, :boolean

      t.integer :company_id
      t.timestamps
    end
  end
end
