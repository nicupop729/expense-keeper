require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create!(name: 'Nicu', email: 'nicu@gmail.com', password: 'password')
  end

  before do
    User.create!(name: 'Tom', email: 'tom@gmail.com', password: 'password')
    User.create!(name: 'Alice', email: 'alice@gmail.com', password: 'password')
    subject.save
  end

  it 'returns 3 users' do
    expect(User.count).to eq(3)
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid if the name is too short' do
    subject.name = 'ab'
    expect(subject).to_not be_valid
  end

  it 'is not valid if the name is too long' do
    subject.name = 'qwertyuiopasdfghjklzxcvbnm'
    expect(subject).to_not be_valid
  end
end 