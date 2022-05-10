class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :expenses
  has_many :categories

  validates :name, presence: true, length: { in: 3..25 }
end
