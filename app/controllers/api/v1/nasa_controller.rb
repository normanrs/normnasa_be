class Api::V1::NasaController < ApplicationController
  require 'twitter'


  def show
    latest = client.user_timeline(8295072).take(1)[0]
    render json: NasaSerializer.new(latest)
  end


private

  def client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['tw_apikey']
      config.consumer_secret     = ENV['tw_apisecret']
      config.access_token        = ENV['tw_acctoken']
      config.access_token_secret = ENV['tw_accsecret']
    end
  end

end
