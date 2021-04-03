require 'rails_helper'

describe "the state delete request", :type => :request do

  let!(:state) { FactoryBot.create(:state)}
  before { delete "/api/v1/states/#{state.id}"}

  context 'when successful' do
    it 'deletes a state based on id' do
      expect(JSON.parse(response.body)["message"]).to eq("You have successfully deleted the state with id #{state.id}.")
    end
    it { expect(response).to have_http_status(200) }
  end

  context 'when not successful' do
    before { get "/api/v1/states/#{state.id + 1}"}
    it { expect(response).to have_http_status(404) }
  end
end