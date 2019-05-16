class CreateBasketItems < ActiveRecord::Migration[5.2]
  def change
    create_table :basket_items do |t|
      t.references :basket, foreign_key: true
      t.references :shirt, foreign_key: true
      t.integer :price_cents

      t.timestamps
    end
  end
end
