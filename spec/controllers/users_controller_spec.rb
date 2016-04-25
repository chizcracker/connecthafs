require 'rails_helper'

describe UsersController, type: :controller do
  describe "GET #show" do
    context 'with existing user' do
      let(:user_id) { User.create!.id }

      it "returns http success" do
        get :show, id: user_id
        expect(response).to have_http_status(:success)
      end
    end

    context 'with non-existing user' do
      let(:user_id) { SecureRandom.uuid }

      it "returns 404" do
        expect{ get :show, id: user_id }.to raise_exception(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe "PUT #update" do
    let(:user_id) { User.create!.id }

    it "returns http success" do
      post :update, {id: user_id}, {}
      expect(response).to have_http_status(:success)
    end
  end
end
