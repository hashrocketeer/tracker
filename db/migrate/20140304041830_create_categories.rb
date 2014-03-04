class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.column :category_name, :string

      t.column :deleted, :boolean

      t.integer :company_id
      t.timestamps
    end
  end
end
