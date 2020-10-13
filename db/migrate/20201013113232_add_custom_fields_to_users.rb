class AddCustomFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_column :users, :city, :string
    add_column :users, :schoolcode_school, :string
    add_column :users, :level, :string
    add_column :users, :contact, :string
    add_column :users, :matricule, :string
    add_column :users, :role, :string
    add_column :users, :slug, :string
  end
end
