require 'open-uri'

class WeatherService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(url: 'http://api.openweathermap.org/data/2.5')
    # connection.params["APPID"] = ENV["WEATHER_KEY"]
    # @current_user = current_user
  end

  def info(city_name)
    binding.pry
    # parse(connection.get("weather", ["q=#{city_name}", "APPID="]))
    parse(connection.get("/weather", {q: city_name, APPID: ""}))
# conn.get '/nigiri', { :name => 'Maguro' }   # GET http://sushi.com/nigiri?name=Maguro
  end


  private
    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end

end
