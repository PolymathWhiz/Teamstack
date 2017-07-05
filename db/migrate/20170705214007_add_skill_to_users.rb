class AddSkillToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :skill, :string
  end
end
