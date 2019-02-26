require 'rails_helper'

describe 'the nasa endpoint' do
  it 'returns the last five nasa pic of the day tweets' do
    VCR.use_cassette("nasa_get") do
      get "/api/v1/nasa"

      expect(response.status).to eq 200
      result = JSON.parse(response.body, symbolize_names: true)
      data = result[:data]
      expect(data).not_to be_empty
      expect(data.length).to eq(5)
      expect(data.first[:attributes].keys.include?(:text)).to be(true)
      expect(data.first[:attributes].keys.include?(:url)).to be(true)
    end
  end

  it 'returns top five nasa pic of the day search results' do
    VCR.use_cassette("nasa_post") do
      param_data = {search: 'cloud'}

      post "/api/v1/nasa", params: param_data

      expect(response.status).to eq 200
      result = JSON.parse(response.body, symbolize_names: true)
      data = result[:data]
      expect(data).not_to be_empty
      expect(data.length).to eq(5)
      expect(data.first[:attributes].keys.include?(:text)).to be(true)
      expect(data.first[:attributes].keys.include?(:url)).to be(true)
    end
  end

end
