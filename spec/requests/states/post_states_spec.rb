require 'rails_helper'

describe "the state post request", :type => :request do
  before { post "/api/v1/states", params: { name: "ThisIsAState"} }

  context 'when successful' do
    it 'creates a new state' do
      expect(JSON.parse(response.body)["message"]).to eq("You have successfully created a state.")
    end
    it { expect(response).to have_http_status(201) }
  end

  context 'when not successful' do
    before { post "/api/v1/states" }
    it { expect(response).to have_http_status(422) }
  end
end