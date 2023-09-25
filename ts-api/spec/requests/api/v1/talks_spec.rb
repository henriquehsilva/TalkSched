require 'rails_helper'

RSpec.describe "Api::V1::Talks", type: :request do
  describe "GET /index" do
    it "returns http success" do

      get "/api/v1/talks/"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    before do
      @talk = FactoryBot.create(:talk)
    end

    it "returns http success" do

      get "/api/v1/talks/", params: { id: @talk.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    before do
      @track = FactoryBot.create(:track)
    end

    it "returns http success" do

      post "/api/v1/talks/", params: { description: "Teste", time: Time.now, duration: 60, track_id: @track.id }
      expect(response).to have_http_status(:created)
    end
  end

  describe "POST /create_from_file" do
    before do
      @file = fixture_file_upload('test_file.txt', 'text/plain')
    end

    it "returns http success" do

      post "/api/v1/talks/create_from_file", params: { file: @file }
      expect(response).to have_http_status(:created)
    end
  end

  describe "PUT /update" do
    before do
      @talk = FactoryBot.create(:talk)
    end

    it "returns http success" do

      put "/api/v1/talks/#{@talk.id}", params: { description: "Teste", duration: 60 }
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE /destroy" do
    before do
      @talk = FactoryBot.create(:talk)
    end

    it "returns http success" do

      delete "/api/v1/talks/#{@talk.id}"
      expect(response).to have_http_status(:no_content)
    end
  end
end
