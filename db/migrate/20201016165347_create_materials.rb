class CreateMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :materials do |t|
      t.string :title
      t.string :cycle
      t.string :slug
      t.references :user, null: true, foreign_key: true
      t.references :course, null: true, foreign_key: true

      t.timestamps
    end
  end
end
