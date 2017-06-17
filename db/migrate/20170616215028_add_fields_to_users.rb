class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :twitter, :string
    add_column :users, :github, :string
    add_column :users, :linkedin, :string
    add_column :users, :website, :string
    add_column :users, :avaliable, :boolean
  end
end
