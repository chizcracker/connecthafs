require 'rails_helper'

describe User, type: :model do
  let(:mock_auth) { double }
  before do
    allow(mock_auth).to receive(:uid).and_return("some-uid")
    allow(mock_auth).to receive(:provider).and_return("facebook")
    allow(mock_auth).to receive_message_chain(:info, :name).and_return("Test Name")
    allow(mock_auth).to receive_message_chain(:info, :email).and_return("test@email.com")
    allow(Devise).to receive(:friendly_token).and_return("012345678901234567890")
  end
 

  context "when user does not exit" do
    it "creates new user" do
      User.from_omniauth(mock_auth)
      result = User.where(provider: "facebook", uid: "some-uid")
      expect(result).to exist
      user = result.first
      expect(user.email).to eq("test@email.com")
      expect(user.name).to eq("Test Name")
    end
  end
  context "when user does exit" do
    let!(:existing_user) do
      User.create!(
        email: "test@email.com",
        name: "Test Name",
        provider: "facebook",
        uid: "some-uid",
        password: "123456"
      )
    end

    it "uses existing user" do
      previous_count = User.count
      User.from_omniauth(mock_auth)
      expect(User.count).to eq(previous_count)
      result = User.where(provider: "facebook", uid: "some-uid")
      expect(result).to exist
      user = result.first
      expect(user.email).to eq("test@email.com")
      expect(user.name).to eq("Test Name")
    end
  end
end
