class AddPunchlineToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :punchline, :string
  end
end
