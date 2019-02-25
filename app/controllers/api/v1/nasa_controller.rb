class Api::V1::NasaController < ApplicationController
  require 'twitter'

  def show
    recent_five = client.user_timeline(8295072).take(5)
    tweets = recent_five.map do |tweet|
      text = tweet.text.split(':')[0]
      url = URI::extract(tweet.text)[1]
      Nasatweet.new(text, url)
    end
    render json: NasaSerializer.new(tweets)
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