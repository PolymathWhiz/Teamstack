class Contact < ApplicationRecord
  before_save :downcase_email

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: false, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  validates :subject, presence: true, length: { maximum: 50 }
  validates :message, presence: true, length: { maximum: 200 }

  private
    def downcase_email
      email.downcase!
    end
end
