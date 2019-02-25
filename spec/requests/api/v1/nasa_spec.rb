require 'rails_helper'

describe 'the nasa endpoint' do
  it 'returns content json from objects' do
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

end
