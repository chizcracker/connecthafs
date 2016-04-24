require 'rails_helper'

describe UserController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    it "returns http success" do
      put :update
      expect(response).to have_http_status(:success)
    end
  end
end
