RSpec.describe EntitiesController, type: :controller do
  let(:user) { create(:user) } # Assuming you have a User factory
  let(:group) { create(:group, user: user) } # Assuming a Group factory

  describe 'GET #index' do
    it 'renders the index template' do
      sign_in user
      get :index, params: { group_id: group.id }
      expect(response).to render_template :index
    end

    it 'assigns entities of the group to @entities' do
      sign_in user
      entity = create(:entity, group: group) # Assuming an Entity factory
      get :index, params: { group_id: group.id }
      expect(assigns(:entities)).to eq([entity])
    end
  end
end
