class Expense < ApplicationRecord
  belongs_to :user
  has_many :category_expenses
  has_many :categories, through: :category_expenses

  validates :name, presence: true, length: { in: 3..25 }
  validates :amount, presence: true, numericality: { greater_than: 0, less_than: BigDecimal(10**6) }
end
