require "rails_helper"

RSpec.describe "/groups", type: :request do
  let!(:auth_token) { create(:auth_token, jwt_token: authorization_token, expiration_time: 1.hour.from_now.to_i) }
  let(:authorization_token) { SecureRandom.base58(24) }

  let(:headers) do
    {
      "Content-Type" => "application/json",
      "Accept" => "application/json",
      "Authorization" => authorization_token,
    }
  end

  context "authentication" do
    let(:path) { groups_path }

    it "should require an authentication token" do
      get path, headers: headers.merge("Authorization" => "")
      expect(response.status).to eq 401
      expect(JSON.parse(response.body)["errors"]).to eq([I18n.t("authorization.token_not_present")])
    end

    it "should require a valid authentication token" do
      get path, headers: headers.merge("Authorization" => "Invalid Token")
      expect(response.status).to eq 401
      expect(JSON.parse(response.body)["errors"]).to eq([I18n.t("authorization.user_unauthorized")])
    end
  end

  context "show" do
    subject { get path, headers: headers }

    let(:path) { groups_path(group.id) }
    let(:group) { create(:group) }

    it "should return the group" do
      subject

      expect(response.status).to eq 200
      expect(JSON.parse(response.body)[0]).to eq(group.to_hash)
    end
  end

  context "index" do
    subject { get path, headers: headers }

    let(:path) { groups_path }
    let!(:groups) { create_list(:group, 2) }

    it "should return the groups" do
      subject

      expect(response.status).to eq 200
      expect(JSON.parse(response.body)).to match_array(Group.serialize(groups))
    end
  end
end
