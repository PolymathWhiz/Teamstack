class User < ApplicationRecord
  before_save :normalize_fields

  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  validates :bio, length: { maximum: 250 }
  validates :first_name, :last_name, presence: true, length: { maximum: 50 }
  validates :website, length: { maximum: 200 }

  acts_as_followable
  acts_as_follower
  
  has_one :skill, dependent: :destroy
  accepts_nested_attributes_for :skill, allow_destroy: true, reject_if: :all_blank, update_only: true
  
  searchkick word_middle: [:search_data]

  private 

  def normalize_fields
    self.first_name = first_name.titleize unless first_name.blank? 
    self.last_name = last_name.titleize unless last_name.blank?
    city.capitalize! unless city.blank?
    state.capitalize! unless state.blank?
    twitter.downcase! unless twitter.blank?
    linkedin.downcase! unless linkedin.blank?
    github.downcase! unless github.blank?
  end

  # Search params used
  # by searchkick gem
  def search_data
    {
      first_name: full_name,
      city: city
    }
  end

  # Return the full name of 
  # the use for searching
  def full_name
    "#{first_name} #{last_name}"
  end

end
