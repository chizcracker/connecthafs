require 'rails_helper'

describe UsersController, type: :controller do
  describe "GET #show" do
    context "with existing user" do
      let(:user_id) { User.create!.id }

      it "returns http success" do
        get :show, id: user_id
        expect(response).to have_http_status(:success)
      end
    end

    context "with non-existing user" do
      let(:user_id) { SecureRandom.uuid }

      it "returns 404" do
        expect{ get :show, id: user_id }.to raise_exception(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe "PUT #update" do
    let(:user) { User.create!(name: "name", phone_number: "123-4567") }
    let(:user_id) { user.id }
    let(:update_hash) do
      { "phoneNumber" => "new_phone_number" }
    end

    it "returns http success" do
      put :update, { id: user_id }.merge(update_hash)
      expect(response).to have_http_status(:success)
    end

    it "updates record" do
      put :update, { id: user_id }.merge(update_hash)
      body = JSON.parse(response.body)
      expect(body["phoneNumber"]).to eq(update_hash["phoneNumber"])
    end

    context "with non-existing user" do
      let(:user_id) { SecureRandom.uuid }

      it "returns 404" do
        expect{
          put :update, { id: user_id }.merge(update_hash)
        }.to raise_exception(ActiveRecord::RecordNotFound)
      end
    end
  end
end
