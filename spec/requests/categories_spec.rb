require "rails_helper"

RSpec.describe "/categories", type: :request do
  let!(:auth_token) { create(:auth_token, jwt_token: authorization_token, expiration_time: 1.hour.from_now.to_i) }
  let(:authorization_token) { 'authorization_token' }

  let(:headers) do
    {
      "Content-Type" => "application/json",
      "Accept" => "application/json",
      "Authorization" => authorization_token,
    }
  end

  context "show" do
    subject { get path, headers: headers }

    let(:path) { categories_path(category.id) }
    let(:category) { create(:category) }

    it "should return the category" do
      subject
      expect(response.status).to eq 200
      byebug
      expect(JSON.parse(response.body)).to eq({ "category" => category })
    end
  end
end
