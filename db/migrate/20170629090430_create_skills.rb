class CreateSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :skills do |t|
      t.references :user, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
