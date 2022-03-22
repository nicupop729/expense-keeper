require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) do
    User.create!(name: 'Nicu', email: 'nicu@gmail.com', password: 'password')
  end

  subject { Category.new(user: user, name: 'Food', icon: 'http://icon.com/user/1') }

  before do
    Category.create!(user: user, name: 'Utilities', icon: 'http://icon.com/user/2')
    subject.save 
  end
  it 'returns 2 categories' do
    expect(Category.count).to eq(2)
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'icon field can be empty' do
    subject.icon = nil
    expect(subject).to be_valid
  end

  it 'user has 2 categories' do
    expect(user.categories.count).to eq(2)
  end

  it 'category belongs to user' do
    expect(subject.user).to be(user)
  end
end 