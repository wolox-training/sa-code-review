require 'rails_helper'

RSpec.describe WeatherController, type: :controller do
  describe 'temperature' do
    before do
      allow_any_instance_of(WeatherApi).to receive(:temp).and_return({
        main: {
          temp: 10
        }
      })
    end
    it 'returns status ok' do
      get :temperature, params: { city: :london }
      expect(response).to have_http_status :ok
    end
    it 'returns the temperature' do
      get :temperature, params: { city: :london }
      expect(JSON.parse(response.body)['temperature']).to eq(10)
    end
  end
end
