require 'rails_helper'

RSpec.feature "User registration", type: :feature do
  scenario "User can register" do
    visit new_user_registration_path
    fill_in "Name", with: "John Doe"
    fill_in "Email", with: "john@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    expect(page).to have_text("Welcome! You have signed up successfully.")
  end

  # Add more scenarios for different features
end
