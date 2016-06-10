require 'open-uri'
require 'unirest'
require 'faraday'

class YodaService
  attr_reader :conn

  def initialize
    @conn = Faraday.new(url: "https://yoda.p.mashape.com")
    @conn.headers = {
      "X-Mashape-Key" => "LhfaMAJ8hemshOvsuJDTY6KknPugp1jPViBjsnF3DUiGJuJsjs",
      "Accept" => "text/plain"
    }
  end

  def speak(text)
    request = format(text)
    response = (conn.get("/yoda?sentence=#{request}"))
    response.body
  end

  private

    def format(sentence)
      sentence.gsub(" ", "+")
    end
end
