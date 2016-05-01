require 'rails_helper'

describe UsersController, type: :controller do
  describe "GET #index" do
    context "with existing user" do
      let(:user_count) { rand(1..5) }

      before { user_count.times { User.create! } }

      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end

      it "returns user list" do
        get :index
        body = JSON.parse(response.body)
        expect(body.count).to eq(user_count)
      end
    end
  end

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
    let(:user) { User.create!(name: "name", phone_number: "123-4567", address: "address") }
    let(:user_id) { user.id }
    let(:update_hash) do
      { "phoneNumber" => "new_phone_number" }
    end

    it "returns http success" do
      put :update, { id: user_id }.merge(update_hash)
      expect(response).to have_http_status(:success)
    end

    it "ignores non-attributes" do
      put :create, { id: user_id, "notAttr" => "123" }.merge(update_hash)
      expect(response).to have_http_status(:success)
    end

    context "updates" do
      it "only provided field" do
        put :update, { id: user_id }.merge(update_hash)
        body = JSON.parse(response.body)
        expect(body["phoneNumber"]).to eq(update_hash["phoneNumber"])
        expect(body["address"]).to eq("address")
      end

      it "as provided" do
        put :update, { id: user_id, address: nil }.merge(update_hash)
        body = JSON.parse(response.body)
        expect(body["phoneNumber"]).to eq(update_hash["phoneNumber"])
        expect(body["address"]).to eq(nil)
      end

      it "only editable field" do
        put :update, { id: user_id, name: "some other name" }.merge(update_hash)
        body = JSON.parse(response.body)
        expect(body["phoneNumber"]).to eq(update_hash["phoneNumber"])
        expect(body["name"]).to eq("name")
      end
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

  describe "POST #create" do
    let(:post_hash) do
      { "phoneNumber" => "new_phone_number" }
    end

    it "returns http success" do
      post :create, post_hash
      expect(response).to have_http_status(:success)
    end

    it "ignores non-attributes" do
      post :create, post_hash.merge("notAttr" => "123")
      expect(response).to have_http_status(:success)
    end

    context "creates" do
      it "as provided" do
        post :create, post_hash
        body = JSON.parse(response.body)
        expect(body["phoneNumber"]).to eq(post_hash["phoneNumber"])
        expect(body["address"]).to eq(nil)
      end

      it "only editable field" do
        put :update, { id: user_id, name: "some other name" }.merge(update_hash)
        body = JSON.parse(response.body)
        expect(body["phoneNumber"]).to eq(update_hash["phoneNumber"])
        expect(body["name"]).to eq("name")
      end
    end
  end
end
