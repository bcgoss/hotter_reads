require 'rails_helper'

RSpec.describe Api::V1::ReadsController do
  it 'accepts a valid post request' do
    headers = {"ACCEPT" => 'application/json'}
    params = { read: { url: 'https://www.example.com' } }
    post '/api/v1/reads', params: params, headers: headers

    expect(response.content_type).to eq('application/json')
    expect(response).to have_http_status(:created)
  end

  it 'rejects invalid post requests' do
    headers = {"ACCEPT" => 'application/json'}
    params = { read: { url: 'bad.url' } }
    post '/api/v1/reads', params: params, headers: headers

    expect(response.content_type).to eq('application/json')
    expect(response).to have_http_status(500)
  end

  it 'returns the ten hottest reads' do
    11.times do |n|
      (n+1).times do
        create :read, url: "http://www.example.com/#{n}"
      end
    end

    get '/api/v1/reads'
    body = JSON.parse(response.body, symbolize_names: true)
    expect(response.content_type).to eq('application/json')
    expect(body.first).to eq 'http://www.example.com/10'
    expect(body.count).to eq 10
  end
end
