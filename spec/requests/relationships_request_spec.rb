require 'rails_helper'

RSpec.describe "Relationships", type: :request do

  describe "GET /create" do
    it "returns http success" do
      get "/relationships/create"
      expect(response).to have_http_status(:success)
    end
  end

end
