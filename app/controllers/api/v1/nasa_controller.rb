class Api::V1::NasaController < ApplicationController
  require 'twitter'

  def show
    recent_five = client.user_timeline(8295072).take(5)
    tweets = recent_five.map do |tweet|
      text = tweet.text
      url = tweet.uris.first.attrs[:expanded_url]
      Nasatweet.new(text, url)
    end
    render json: NasaSerializer.new(tweets)
  end

  def index
    recent_five = client.search("apod #{params_in[:search]}").take(5)
    tweets = recent_five.map do |tweet|
      text = tweet.text
      if tweet.uris.any?
        url = tweet.uris.first.attrs[:expanded_url]
      else
        url = 'https://history.nasa.gov/SP-350/ch-13-1.html'
      end
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

  def params_in
    params.permit(:search)
  end


end
