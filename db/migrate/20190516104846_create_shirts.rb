class CreateShirts < ActiveRecord::Migration[5.2]
  def change
    create_table :shirts do |t|
      t.string :name
      t.string :collar
      t.string :cuff
      t.string :placket
      t.string :pocket
      t.string :contrast_collar
      t.text :about
      t.integer :price_cents
      t.string :sku

      t.timestamps
    end
  end
end
