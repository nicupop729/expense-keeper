require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:user) do
    User.create!(name: 'Nicu', email: 'nicu@gmail.com', password: 'password')
  end

  subject do
    Expense.new(user:, name: 'New TV', amount: 700)
  end

  before do
    Expense.create!(user:, name: 'Porche Car', amount: 999_999)
    subject.save
  end

  it 'returns 2 expenses' do
    expect(Expense.count).to eq(2)
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without amount' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'amount is not valid if string' do
    subject.amount = 'abc'
    expect(subject).to_not be_valid
  end

  it 'amount is not valid if 0 or less' do
    subject.amount = 0
    expect(subject).to_not be_valid
  end

  it 'belongs to a user' do
    expect(subject.user).to be(user)
  end
end
