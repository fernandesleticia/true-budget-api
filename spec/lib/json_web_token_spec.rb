# frozen_string_literal: true

require 'rails_helper'

RSpec.describe JsonWebToken do
  let(:payload) { { user_id: "user_id" } }

  describe "#encode" do
    subject { JsonWebToken.encode(payload) }

    it "should generate a access token" do
      expect(subject).to be_kind_of(String)
      expect(subject.split('.').size).to eql(3)
    end
  end

  describe "#decode" do
    subject { JsonWebToken.decode(token) }
    let!(:token) { JsonWebToken.encode(payload) }

    it "should contain the user_id" do
      expect(subject[:user_id]).to eq(payload[:user_id])
    end
  end
end
