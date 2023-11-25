require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = User.new(name: "Example", email: "example@example.com", password: "password")
    expect(user).to be_valid
  end

  it "is not valid without a name" do
    user = User.new(email: "example@example.com", password: "password")
    expect(user).to_not be_valid
  end

  # Add more tests for your models
end
