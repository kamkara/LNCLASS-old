class RenameSchoolToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :schoolcode_school, :school_name
  end
end
