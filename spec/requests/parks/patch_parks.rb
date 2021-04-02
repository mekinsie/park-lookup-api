require 'rails_helper'

describe "the park patch request", :type => :request do

  let!(:park) { FactoryBot.create(:park)}
  before { patch "/api/v1/states/1/parks/#{park.id}"}, params: { name: "Willamette"}

  context 'when successful' do
    it 'updates a park based on id' do
      expect(JSON.parse(response.body)["message"]).to eq("This park has been successfully updated.")
    end
    it { expect(response).to have_http_status(200) }
  end

  context 'when not successful' do
    before { get "/api/v1/states/1/parks/#{park.id + 1}"}
    it { expect(response).to have_http_status(404) }
  end
end