require 'open-uri'

class WeatherService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(:url => 'http://api.openweathermap.org/data/2.5')
  end

  def temp_info(city_name)
    response = parse(connection.get("weather?q=#{city_name}&APPID=#{ENV["WEATHER_KEY"]}"))
    # binding.pry
    kelvin = response[:main][:temp]
    fahrenheit = (1.8 * (kelvin - 273)) + 32
    fahrenheit.to_i

  end

  def weather_descriptions
    weather = ["Clear",
               "Rain",
               "Clouds",
               "Fog",
               "Mist",
               "Haze",
               "Snow",
               "Drizzle",
               "Thunderstorm"]
  end

  private
    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end

end
