require 'rails_helper'

RSpec.describe 'Group', type: :model do
  Rails.application.routes.default_url_options[:host] = 'localhost:3000'
  let(:user) { User.new(fname: 'admin user', email: 'user@example.com', password: 'password') }
  let(:group) do
    Group.new(name: 'Bread', icon: 'https//a.com', user:)
  end
  let(:entity) { Entity.new(name: 'Flour', amount: 20, author_id: user.id) }
  before { user.save }
  before { group.save }
  before { entity.save }

  context 'validity' do
    it 'is valid when all attributes are present' do
      expect(group).to be_valid
    end
  end

  context 'invalidity:' do
    it 'is not valid when name is not present' do
      group.name = nil
      expect(group).not_to be_valid
    end
  end
end
