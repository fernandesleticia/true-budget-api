require "rails_helper"

RSpec.describe "/category_budgets", type: :request do
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
    let(:path) { category_budgets_path }

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

    let(:path) { category_budgets_path(category_budget.id) }
    let(:category_budget) { create(:category_budget) }

    it "should return the category_budget" do
      subject

      expect(response.status).to eq 200
      expect(JSON.parse(response.body)[0]).to eq(category_budget.to_hash)
    end
  end

  context "index" do
    subject { get path, headers: headers }

    let(:path) { category_budgets_path }
    let!(:category_budgets) { create_list(:category_budget, 2) }

    it "should return the category_budgets" do
      subject

      expect(response.status).to eq 200
      expect(JSON.parse(response.body)).to match_array(CategoryBudget.serialize(category_budgets))
    end
  end
end
