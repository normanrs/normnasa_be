class ApplicationController < ActionController::API
  require 'twitter'

  private

    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['tw_apikey']
      config.consumer_secret     = ENV['tw_apisecret']
      config.access_token        = ENV['tw_acctoken']
      config.access_token_secret = ENV['tw_accsecret']
    end

end
