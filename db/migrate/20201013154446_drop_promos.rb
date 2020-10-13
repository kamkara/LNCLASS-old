class DropPromos < ActiveRecord::Migration[6.0]
  def change
    drop_table :promos
  end
end
