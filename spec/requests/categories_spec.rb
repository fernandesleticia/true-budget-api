require "rails_helper"

RSpec.describe "/categories", type: :request do
  let!(:auth_token) { create(:auth_token, jwt_token: authorization_token, expiration_time: 1.hour.from_now.to_i) }
  let(:authorization_token) { SecureRandom.base58(24) }

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
      expect(JSON.parse(response.body)[0]).to eq(category.to_hash)
    end
  end

  context "index" do
    subject { get path, headers: headers }

    let(:path) { categories_path }
    let!(:categories) { create_list(:category, 2) }

    it "should return the categories" do
      subject

      expect(response.status).to eq 200
      expect(JSON.parse(response.body)).to match_array(Category.serialize(categories))
    end
  end
end
