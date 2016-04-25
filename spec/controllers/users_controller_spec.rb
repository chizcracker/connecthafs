require 'rails_helper'

describe UsersController, type: :controller do
  describe "GET #show" do
    let(:user_id) { SecureRandom.uuid }

    context 'with existing user' do
      let!(:user) { User.create! }
      let(:user_id) { User.create!.id }

      it "returns http success" do
        get user_path(user_id)
        expect(response).to have_http_status(:success)
      end
    end

    it "returns 404" do
      get user_path(user_id)
      expect(response).to have_http_status(404)
    end
  end

  describe "PUT #update" do
    it "returns http success" do
      put :update
      expect(response).to have_http_status(:success)
    end
  end
end
