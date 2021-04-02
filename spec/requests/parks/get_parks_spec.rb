require 'rails_helper'

describe "the parks get request", :type => :request do

  let!(:parks) { FactoryBot.create_list(:park, 5)}
  before { get '/api/v1/states/1/parks'}

  context 'when successful' do
    it 'returns all parks' do
      expect(JSON.parse(response.body).size).to eq(5)
    end
    it { expect(response).to have_http_status(200) }
  end
end

describe "the park get request", :type => :request do

  let!(:parks) { FactoryBot.create_list(:park, 5)}
  before { get "/api/v1/states/1/parks/#{parks.first.id}"}

  context 'when successful' do
    it 'returns a park based on id' do
      expect(JSON.parse(response.body)["name"]).to eq(parks.first.name)
    end
    it { expect(response).to have_http_status(200) }
  end

  context 'when not successful' do
    before { get "/api/v1/states/1/parks/#{parks.last.id + 1}"}
    it { expect(response).to have_http_status(404) }
  end
end