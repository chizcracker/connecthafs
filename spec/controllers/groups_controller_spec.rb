require 'rails_helper'

describe GroupsController, type: :controller do
  describe "GET #show" do
    context "with existing group" do
      let(:group_id) { Group.create!.id }

      it "returns http success" do
        get :show, id: group_id
        expect(response).to have_http_status(:success)
      end
    end

    context "with non-existing group" do
      let(:group_id) { SecureRandom.uuid }

      it "returns 404" do
        expect{ get :show, id: group_id }.to raise_exception(ActiveRecord::RecordNotFound)
      end
    end
  end
end
