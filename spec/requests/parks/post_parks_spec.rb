require 'rails_helper'

describe "the park post request", :type => :request do

  let!(:park) { FactoryBot.create(:park)}
  let!(:state) {FactoryBot.create(:state)}
  before { post "/api/v1/states/1/parks", params: { name: "Willamette", park_type: "State park", state_id: 1 }}

  context 'when successful' do
    it 'creates a new park' do
      expect(JSON.parse(response.body)["message"]).to eq("You have successfully created a park.")
    end
    it { expect(response).to have_http_status(201) }
  end

  context 'when not successful' do
    before { post "/api/v1/states/1/parks" }
    it { expect(response).to have_http_status(422) }
  end
end