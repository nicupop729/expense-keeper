class Expense < ApplicationRecord
  belongs_to :user
  has_many :category_expenses
  has_many :categories, through :category_expenses

  validates :name, presence: true
  validates :amount, numericality: { greater_that_or_equal_to: 0, less_than: BigDecimal(10**6)}
end
