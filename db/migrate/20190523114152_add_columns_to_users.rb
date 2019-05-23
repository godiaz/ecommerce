class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :date_of_birth, :string
    add_column :users, :phone, :string
    add_column :users, :occupation, :string
    add_column :users, :height, :integer
    add_column :users, :weight, :integer
    add_column :users, :shoe_size, :integer
    add_column :users, :chest, :string
    add_column :users, :stomach, :string
    add_column :users, :arms, :string
    add_column :users, :seat, :string
    add_column :users, :thigh, :string
    add_column :users, :body_description, :text
    add_column :users, :preferred_fit, :string
    add_column :users, :dominant_hand, :string
    add_column :users, :jacket_size, :integer
    add_column :users, :trouser_waist_size, :integer
    add_column :users, :shirt_collar_size, :integer
    add_column :users, :shirt_notes, :text
    add_column :users, :jacket_notes, :text
    add_column :users, :trouser_notes, :text
  end
end
