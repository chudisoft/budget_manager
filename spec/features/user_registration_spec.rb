require 'rails_helper'

RSpec.feature 'User registration', type: :feature do
  scenario 'User can register' do
    visit new_user_registration_path
    fill_in 'user_fname', with: 'admin user'
    fill_in 'user_email', with: 'admin@abc.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_text('Welcome! You have signed up successfully.')
  end
end
