class CreateSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :sigle
      t.string :role
      t.string :contact
      t.string :school_address
      t.string :city
      t.string :code_school
      t.string :code_secret
      t.string :slug
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
