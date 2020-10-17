class AddMaterialIndexToCourses < ActiveRecord::Migration[6.0]
    def change
    add_column :courses, :material_id, :bigint

  end
  def change
    add_index :courses, :material_id, unique: true
  end

  def change
     add_reference :courses, :material, foreign_key: true
  end
end
