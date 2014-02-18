class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.column :company_name, :string

      t.timestamps
    end
  end
end
