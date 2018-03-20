class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :likes

  validates :email, uniqueness: { case_sensitive: false }
end
