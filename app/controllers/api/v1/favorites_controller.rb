class Api::V1::FavoritesController < ApplicationController
  def create
    begin
      user = Favorite.create(params_in)
      raise 'Bad data' unless user.save
      render json: FavoriteSerializer.new(user), status: 201
    rescue StandardError => err
      render json:{message: err}, status: 400
    end
  end

  def index
    begin
      user = User.find_by(api_key: params_in[:api_key])
      raise 'Bad api_key' unless user
      favs = Favorite.where(user_id: user.id)
      render json: FavoriteSerializer.new(favs)
    rescue StandardError => err
      render json: { message: err }, status: 404
    end
  end

  private

  def params_in
    params.permit(:text, :url, :user_id, :api_key)
  end
end
