class User < ApplicationRecord
  before_save :capitalize_firstname, :capitalize_lastname

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :bio, length: { maximum: 250 }
  validates :first_name, :last_name, length: { maximum: 255 }

  private 

  def capitalize_firstname
    first_name.capitalize!
  end

  def capitalize_lastname
    last_name.capitalize!
  end
end
