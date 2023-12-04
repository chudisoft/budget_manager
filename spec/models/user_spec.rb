require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(fname: 'admin user', email: 'example@example.com', password: 'password')
    expect(user).to be_valid
  end

  it 'is not valid without a email' do
    user = User.new(password: 'password')
    expect(user).to_not be_valid
  end

  # Add more tests for your models
end
