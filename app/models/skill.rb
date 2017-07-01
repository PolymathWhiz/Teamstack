class Skill < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :name, length: { maximum: 200 }

  searchkick word_middle: [:search_data]

  private

  def search_data
    {
      name: name
    }
  end
end
