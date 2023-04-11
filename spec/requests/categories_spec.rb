require "rails_helper"

RSpec.describe "/categories", type: :request do
  let!(:auth_token) { create(:auth_token, jwt_token: authorization_token, expiration_time: 1.hour.from_now.to_i) }
  let(:payload) { { user_id: user.id } }
  let(:user) { create(:user) }
  let(:authorization_token) { JsonWebToken.encode(payload) }

  let(:headers) do
    {
      "Content-Type" => "application/json",
      "Accept" => "application/json",
      "Authorization" => authorization_token,
    }
  end

  context "authentication" do
    let(:path) { categories_path }

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

    it "should return an error message when not authorized" do
      allow_any_instance_of(CategoryPolicy).to receive(:index?).and_raise(Pundit::NotAuthorizedError)
      get path, headers: headers
      expect(response.status).to eq 401
    end

    it "should return the categories" do
      subject

      expect(response.status).to eq 200
      expect(JSON.parse(response.body)).to match_array(Category.serialize(categories))
    end
  end
end
