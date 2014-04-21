class CreateTrainees < ActiveRecord::Migration
  def change
    create_table :trainees do |t|
      t.column :first_name, :string
      t.column :last_name, :string
      t.column :phone, :string
      t.column :badge_id, :string
      t.column :employee_number, :string

      t.column :deleted, :boolean

      t.integer :company_id
      t.integer :category_id
      t.integer :department_id
      t.integer :job_title_id

      t.timestamps
    end
  end
end
