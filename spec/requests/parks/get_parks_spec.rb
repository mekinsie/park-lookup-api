require 'rails_helper'


describe "the parks get request", :type => :request do
  let!(:parks) { FactoryBot.create_list(:park, 5)}
  before { get '/api/v1/states/1/parks'}
  context 'when successful' do
    it 'returns all parks' do
      expect(JSON.parse(response.body).size).to eq(5)
    end
    it 'returns a status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe "the park get request", :type => :request do
    let!(:parks) { FactoryBot.create_list(:park, 5)}
    before { get "/api/v1/states/1/parks/#{parks.first.id}"}
    context 'when successful' do
      it 'returns a park based on id' do
        expect(JSON.parse(response.body)["name"]).to eq(parks.first.name)
      end

    end
  end
end