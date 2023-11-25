RSpec.describe GroupsController, type: :controller do
  let(:user) { create(:user) } # Assuming you have a User factory

  describe 'GET #index' do
    it 'renders the index template' do
      sign_in user
      get :index
      expect(response).to render_template :index
    end

    it 'assigns user groups to @groups' do
      sign_in user
      group = create(:group, user: user) # Assuming a Group factory
      get :index
      expect(assigns(:groups)).to eq([group])
    end
  end
end
