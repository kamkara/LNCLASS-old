class AddMaterialToExercices < ActiveRecord::Migration[6.0]
  def change
    add_column :exercices, :material, :string
  end
end
