require 'rails_helper'

describe "the parks get request" do
  let!(:parks) { FactoryBot.create_list(:park, 5)}

  before { get '/api/v1/states/1/parks'}

  it 'returns all parks' do
    expect(JSON.parse(response.body).size).to eq(5)
  end


end