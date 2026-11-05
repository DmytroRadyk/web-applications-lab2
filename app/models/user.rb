class User < ApplicationRecord
  has_many :microposts, dependent: :destroy
  normalizes :email, with: ->(email) { email.strip.downcase }
  validates :name, presence: true, length: { maximum: 100 }
  validates :email, presence: true, uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP }
end
