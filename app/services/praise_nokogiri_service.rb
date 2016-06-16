require 'nokogiri'
require 'open-uri'

class PraiseNokogiriService

  attr_reader :praise_noko_doc

  def initialize
    @praise_noko_doc = Nokogiri::HTML(open('http://www.madsci.org/cgi-bin/cgiwrap/~lynn/jardin/SCG'))
  end

  def todays_praise
    praise_noko_doc.xpath('/html/body/center/h2').text
  end

end
