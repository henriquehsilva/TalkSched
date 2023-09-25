require 'rails_helper'

RSpec.describe "Api::V1::Tracks", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/api/v1/tracks/"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    before do
      @track = FactoryBot.create(:track)
    end

    it "returns http success" do
      get "/api/v1/tracks/", params: { id: @track.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "returns http success" do
      post "/api/v1/tracks/", params: { name: "Teste" }
      expect(response).to have_http_status(:created)
    end
  end

  describe "PUT /update" do
    before do
      @track = FactoryBot.create(:track)
    end

    it "returns http success" do
      put "/api/v1/tracks/#{@track.id}", params: { name: "Teste" }
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE /destroy" do
    before do
      @track = FactoryBot.create(:track)
    end

    it "returns http success" do
      delete "/api/v1/tracks/#{@track.id}"
      expect(response).to have_http_status(:no_content)
    end
  end
end
