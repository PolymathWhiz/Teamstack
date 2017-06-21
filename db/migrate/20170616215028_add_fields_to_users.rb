class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :twitter, :string, default: "", null: false
    add_column :users, :github, :string, default: "", null: false
    add_column :users, :linkedin, :string, default: "", null: false
    add_column :users, :website, :string, default: "", null: false
    add_column :users, :avaliable, :boolean, default: true, null: false
  end
end
