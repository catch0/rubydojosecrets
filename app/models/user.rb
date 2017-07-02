class User < ActiveRecord::Base
  has_many :secrets
  has_many :likes
  has_many :secrets_liked, through: :likes, source: :secret
  validates :first_name, :last_name, :email, presence: true
  has_secure_password
end
