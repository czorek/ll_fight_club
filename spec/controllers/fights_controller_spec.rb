require 'rails_helper'

RSpec.describe FightsController, type: :controller do
  login_user

  let(:user)       { create(:user) }
  let(:fighter)    { create(:fighter, user: user) }
  let(:opponent)   { create(:fighter) }

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  # describe "POST #create" do
  #   context 'with valid params' do
  #     it 'creates a fight instance' do
  #       expect { post :create, fight: { selected_fighter: fighter.id, winner: fighter, loser: opponent } }
  #         .to change { Fight.count }.by(1)
  #     end
  #   end
  # end
end
