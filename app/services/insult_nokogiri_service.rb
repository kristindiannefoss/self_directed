require 'nokogiri'
require 'open-uri'

class InsultNokogiriService

  attr_reader :insult_noko_doc

  def initialize
    @insult_noko_doc = Nokogiri::HTML(open('http://datahamster.com/autoinsult/index.php?style=3'))

  end

  def todays_insult
    insult = insult_noko_doc.xpath('//*[@id="insult"]').text
  end


end
