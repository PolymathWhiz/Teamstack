class User < ApplicationRecord
  before_save :capitalize_fields, :lower_case_fields

  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  validates :bio, length: { maximum: 250 }
  validates :first_name, :last_name, presence: true, length: { maximum: 50 }
  validates :website, length: { maximum: 200 }

  acts_as_followable
  acts_as_follower

  private 

  def capitalize_fields
    first_name.capitalize! unless first_name.blank? 
    last_name.capitalize! unless last_name.blank?
    city.capitalize! unless city.blank?
    state.capitalize! unless state.blank?
  end

  def lower_case_fields
    # website.downcase! unless website.blank?
    twitter.downcase! unless twitter.blank?
    linkedin.downcase! unless linkedin.blank?
    github.downcase! unless github.blank?
  end
end
