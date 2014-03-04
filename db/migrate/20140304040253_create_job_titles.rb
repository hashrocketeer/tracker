class CreateJobTitles < ActiveRecord::Migration
  def change
    create_table :job_titles do |t|
      t.column :job_title_name, :string
      t.column :deleted, :boolean

      t.integer :company_id
      t.timestamps
    end
  end
end
