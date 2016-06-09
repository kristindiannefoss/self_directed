require 'open-uri'

class WeatherService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(:url => 'http://api.openweathermap.org/data/2.5')
  end

  def info(city_name)
    parse(connection.get("weather?q=#{city_name}&APPID=#{ENV["WEATHER_KEY"]}"))[:main][:temp]
  end


  private
    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end

end
