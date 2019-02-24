class Api::V1::NasaController < ApiBaseController

  def show
    today = Nasatweet.new
    render json: NasatweetSerializer.new(today)
  end

end
