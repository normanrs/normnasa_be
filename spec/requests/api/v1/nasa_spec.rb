require 'rails_helper'

describe 'the forecast endpoint' do
  it 'returns content json from objects' do
    # VCR.use_cassette("forecast_endpoint_spec") do
      get "/api/v1/nasa"

      expect(response.status).to eq 200
      result = JSON.parse(response.body, symbolize_names: true)
      expect(result[:data][:attributes]).not_to be_empty
      expect(result[:data][:attributes].keys.include?(:pic_url)).to be(true)
      expect(result[:data][:attributes].keys.include?(:quote)).to be(true)
      expect(result[:data][:attributes][:tweets].count).to eq(8)
    # end
  end


end
