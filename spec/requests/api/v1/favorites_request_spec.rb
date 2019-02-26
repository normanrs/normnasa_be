require 'rails_helper'

RSpec.describe 'the favorites endpoint' do
  it 'returns a users favorites when supplied the correct api_key' do
    user = create(:user)
    create(:favorite, user_id: user.id)
    create(:favorite, user_id: user.id)
    create(:favorite, user_id: user.id)
    create(:favorite, user_id: user.id)

    get "/api/v1/favorites?api_key=#{user.api_key}"
    expect(response.status).to eq(200)
    data = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(data.count).to eq(4)
    expect(data.first[:attributes].keys.include?(:text)).to be(true)
    expect(data.first[:attributes].keys.include?(:url)).to be(true)
  end

  it 'doesnt return favorites when supplied a bad api key' do
    user = create(:user)
    create(:favorite, user_id: user.id)

    get "/api/v1/favorites?api_key='hahahahah'"
    expect(response.status).to eq(404)
    actual = JSON.parse(response.body)
    expect(actual["message"]).to eq("Bad api_key")
  end

end
