class User < ApplicationRecord
  # before_save :capitalize_fields, :lower_case_fields if commit == 'update'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :bio, length: { maximum: 250 }
  validates :first_name, :last_name, length: { maximum: 50 }

  # private 

  # def capitalize_fields
  #   first_name.capitalize!
  #   last_name.capitalize!
  #   city.capitalize!
  #   state.capitalize!
  # end

  # def lower_case_fields
  #   website.downcase!
  #   twitter.downcase!
  #   linkedin.downcase!
  #   github.downcase!
  # end
end
