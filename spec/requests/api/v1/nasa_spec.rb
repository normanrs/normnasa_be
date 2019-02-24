require 'rails_helper'

describe 'the nasa endpoint' do
  it 'returns content json from objects' do
    # VCR.use_cassette("forecast_endpoint_spec") do
      get "/api/v1/nasa"

      expect(response.status).to eq 200
      result = JSON.parse(response.body, symbolize_names: true)
      data = result[:data][:attributes]
      expect(data).not_to be_empty
      expect(data.keys.include?(:text)).to be(true)
    # end
  end


end
