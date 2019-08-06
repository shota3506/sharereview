class User < ApplicationRecord
  has_secure_password

  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :password, presence: true
  validates :email, presence: true, uniqueness: true

end
