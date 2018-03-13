class WeatherController < ApplicationController
  def temperature
    response =  WeatherApi.new.temp(params[:city])
    if response.status_code != 200
      render json: { error: 'There was a problem' }, status: :bad_request
    else
      render json: { temperature: response.body[:main][:temp] }
    end
  end
end
