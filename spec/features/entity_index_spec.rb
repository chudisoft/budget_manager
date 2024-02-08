require 'rails_helper'

RSpec.describe 'Entity index', type: :feature do
  Rails.application.routes.default_url_options[:host] = 'localhost:3000'
  let(:user) { User.new(fname: 'admin user', email: 'user@example.com', password: 'password') }
  let(:group) { Group.new(name: 'Flour', icon: 'https://', user:) }
  let(:entity) do
    Entity.new(name: 'Bread', amount: 30, author_id: user.id)
  end

  before { user.save }
  before { group.save }
  before { entity.save }

  before(:each) do
    visit new_user_session_path
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    visit group_entities_path(group_id: group.id)
  end

  describe 'entity index' do
    it 'shows a list of entities' do
      expect(page).to have_content('New Entity')
      group.entities.each do |entity|
        expect(page).to have_content(entity.name)
      end
    end
  end
end
