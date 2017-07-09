class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.references :user, foreign_key: true
      t.text :description
      t.string :category

      t.timestamps
    end
  end
end
