require 'rails_helper'

describe "the state patch request", :type => :request do

  let!(:state) { FactoryBot.create(:state)}
  before { patch "/api/v1/states/#{state.id}", params: { name: "Oregooooon"}}
  context 'when successful' do
    it 'updates a state based on id' do
      expect(JSON.parse(response.body)["message"]).to eq("This state has been successfully updated.")
    end
    it { expect(response).to have_http_status(200) }
  end

  context 'when not successful' do
    before { get "/api/v1/states/#{state.id + 1}"}
    it { expect(response).to have_http_status(404) }
  end
end