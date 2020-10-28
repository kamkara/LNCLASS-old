class CreateExercices < ActiveRecord::Migration[6.0]
  def change
    create_table :exercices do |t|
      t.string :title
      t.text :content_exercice
      t.string :author
      t.bigint :course_id
      t.string :slug
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
