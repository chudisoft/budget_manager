require 'rails_helper'

RSpec.describe 'Group index', type: :feature do
  Rails.application.routes.default_url_options[:host] = 'localhost:3000'
  let(:user) { User.new(fname: 'admin user', email: 'user@example.com', password: 'password') }
  let(:group) { Group.new(name: 'Flour', icon: 'https://', user:) }

  before { user.save }
  before { group.save }

  before(:each) do
    visit new_user_session_path
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    visit groups_path
  end

  describe 'group index' do
    it 'shows a list of groups' do
      expect(page).to have_content('New Group')
      user.groups.each do |group|
        expect(page).to have_content(group.name)
      end
    end
  end
end

RSpec.describe 'Group New', type: :feature do
  Rails.application.routes.default_url_options[:host] = 'localhost:3000'
  let(:user) { User.new(fname: 'admin user', email: 'user@example.com', password: 'password') }
  let(:group) { Group.new(name: 'Flour', icon: 'https://', user:) }

  before { user.save }
  before { group.save }

  before(:each) do
    visit new_user_session_path
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    visit groups_path
  end

  describe 'Click events' do
    it 'navigates to the new group page' do
      # puts page.body
      click_on 'Add Group'
      expect(page).to have_current_path(new_group_path)
      expect(page).to have_content('Name')
    end
  end
end
