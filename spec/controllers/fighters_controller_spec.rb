require 'rails_helper'

RSpec.describe FightersController, type: :controller do
  login_user
  let(:fighter) { create(:fighter) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a fighter' do
        expect { post :create, fighter: FactoryGirl.attributes_for(:fighter) }.to change { Fighter.count }.by(1)
      end
    end

    context 'with invalid attributes' do
      it 'does not create a fighter' do
        expect { post :create, fighter: { first_name: nil, last_name: nil, description: nil, avatar: nil } }.to_not change { Fighter.count }
      end
    end
  end
end
