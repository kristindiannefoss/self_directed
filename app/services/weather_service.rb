require 'open-uri'

class WeatherService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(url: 'http://api.openweathermap.org/data/2.5')
    # connection.params["APPID"] = "78349e07d595ad8b249034c66e4e2303"
    # connection.params["APPID"] = ENV["WEATHER_KEY"]
    # @current_user = current_user
  end

  def info(city_name)
    binding.pry
    # parse(connection.get("weather", ["q=#{city_name}", "APPID=78349e07d595ad8b249034c66e4e2303"]))
    parse(connection.get("/weather", {q: city_name, APPID: "78349e07d595ad8b249034c66e4e2303"}))
# conn.get '/nigiri', { :name => 'Maguro' }   # GET http://sushi.com/nigiri?name=Maguro
  end


  private
    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end

end
