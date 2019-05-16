class CreateShirtFabrics < ActiveRecord::Migration[5.2]
  def change
    create_table :shirt_fabrics do |t|
      t.references :shirt, foreign_key: true
      t.references :fabric, foreign_key: true

      t.timestamps
    end
  end
end
