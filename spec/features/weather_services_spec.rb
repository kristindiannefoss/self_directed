
require 'rails_helper'

describe 'WeatherService' do
  context "info" do
    it "brings in weather info" do
      VCR.use_cassette("weather_info") do
        @service = WeatherService.new
        weather_info = @service.temp_info("Denver")

        expect(weather_info).to eq(88)
      end

      VCR.use_cassette("weather_info for Austin") do
        @service = WeatherService.new
        weather_info = @service.temp_info("Austin")

        expect(weather_info).to eq(93)
      end
    end
  end
end
