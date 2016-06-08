require 'nokogiri'
require 'open-uri'
attr_reader :noko_doc, :connection

class GithubService
  def initialize
    @noko_doc = Nokogiri::HTML(open('https://github.com/kristindiannefoss'))
    @connection = Hurley.new('')
  end
end
