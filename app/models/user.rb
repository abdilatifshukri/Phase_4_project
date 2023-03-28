class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /@/ }
  validates :password, presence: true, length: { minimum: 8 }
end
