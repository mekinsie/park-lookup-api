require 'rails_helper'

describe "the park delete request", :type => :request do

  let!(:park) { FactoryBot.create(:park)}
  before { delete "/api/v1/states/1/parks/#{park.id}"}

  context 'when successful' do
    it 'returns a park based on id' do
      expect(JSON.parse(response.body)["message"]).to eq("You have successfully deleted the park with id #{park.id}.")
    end
    it { expect(response).to have_http_status(200) }
  end

  context 'when not successful' do
    before { get "/api/v1/states/1/parks/#{park.id + 1}"}
    it { expect(response).to have_http_status(404) }
  end
end