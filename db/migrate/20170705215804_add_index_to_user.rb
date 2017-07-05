class AddIndexToUser < ActiveRecord::Migration[5.0]
  def change
    add_index :users, :skill
    add_index :users, :city
    add_index :users, :first_name
    add_index :users, :last_name
  end
end
