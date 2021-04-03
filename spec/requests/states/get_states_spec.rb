require 'rails_helper'

describe "the states get request", :type => :request do

  let!(:states) { FactoryBot.create_list(:state, 5)}
  before { get '/api/v1/states/'}

  context 'when successful' do
    it 'returns all states' do
      expect(JSON.parse(response.body).size).to eq(State.count)
    end
    it { expect(response).to have_http_status(200) }
  end
end

describe "the state get request", :type => :request do

  let!(:states) { FactoryBot.create_list(:state, 5)}
  before { get "/api/v1/states/#{states.first.id}"}

  context 'when successful' do
    it 'returns a state based on id' do
      expect(JSON.parse(response.body)["name"]).to eq(states.first.name)
    end
    it { expect(response).to have_http_status(200) }
  end

  context 'when not successful' do
    before { get "/api/v1/states/#{states.last.id + 1}"}
    it { expect(response).to have_http_status(404) }
  end
end