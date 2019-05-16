class CreateFabrics < ActiveRecord::Migration[5.2]
  def change
    create_table :fabrics do |t|
      t.string :name
      t.integer :weight
      t.string :mill
      t.string :origin
      t.string :color
      t.string :fabric_type
      t.text :about

      t.timestamps
    end
  end
end
