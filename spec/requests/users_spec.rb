require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /show" do
    it "returns http successfully" do
      get "/users/show"
      expect(response).to be_successful
    end
  end

end
