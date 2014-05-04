class AddColumnsToTrainee < ActiveRecord::Migration
  def change
    change_table :trainees do |t|
      t.string :home_phone
      t.string :fax
      t.string :address
      t.string :internal_address
      t.string :hire_date
      t.string :birth_date
      t.string :termination_date
      t.string :blood_type
      t.string :medical_notes
    end
  end
end
