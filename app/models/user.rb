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

  # self.per_page = 10

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

  # def lower_case_fields
  #   # website.downcase! unless website.blank?
  # end
end
