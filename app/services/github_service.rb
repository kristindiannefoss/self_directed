# require 'nokogiri'
# require 'open-uri'
#
# class GithubService
#   attr_reader :connection
#
#   def initialize(current_user)
#     @current_user = current_user
#     @connection = Faraday.new("https://api.github.com")
#     @connection.headers = {"User-Agent"=>"Faraday v0.9.2", "Authorization" => "token #{@current_user.token}"}
#   end
#
#   def info
#     parse(connection.get("/users/#{@current_user.user_name}"))
#     binding.pry
#   end
#
#   private
#     def parse(response)
#       JSON.parse(response.body, symbolize_names: true)
#     end
#
# end
