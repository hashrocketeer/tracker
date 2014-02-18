class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.column :first_name, :string
      t.column :last_name, :string
      t.column :email, :string
      t.column :password_digest, :string
      t.column :remember_token, :string
      t.column :reset_password_token, :string
      t.column :session_token, :string

      t.column :company_id, :integer

      t.timestamps
    end
  end
end
