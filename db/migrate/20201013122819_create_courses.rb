class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :content
      t.string :matiere
      t.string :level
      t.string :author
      t.string :slug
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
