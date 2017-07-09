class Feedback < ApplicationRecord
  belongs_to :user

  validates_presence_of :category, :description
  validates :description, length: { maximum: 250 }
end
