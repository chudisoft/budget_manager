require 'rails_helper'

RSpec.describe 'Entity', type: :model do
  Rails.application.routes.default_url_options[:host] = 'localhost:3000'

  let(:user) { User.new(fname: 'admin user', email: 'user@example.com', password: 'password') }
  let(:group) do
    Group.new(name: 'Bread', icon: 'https//a.com', user:)
  end
  let(:entity) { Entity.new(name: 'Flour', amount: 20, author_id: user.id, group_ids: [group.id]) }

  before { user.save }
  before { group.save }
  before { entity.save }

  context 'validity' do
    it 'is valid when all attributes are present' do
      expect(entity).to be_valid
    end
  end

  context 'invalidity' do
    it 'is not valid when name is not present' do
      entity.name = nil
      expect(entity).not_to be_valid
    end

    it 'is not valid when amount is less than or equal to zero' do
      entity.amount = 0
      expect(entity).not_to be_valid
    end
  end
end
