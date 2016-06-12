require 'nokogiri'
require 'open-uri'

class PraiseNokogiriService

  attr_reader :praise_noko_doc

  def initialize
    @praise_noko_doc = Nokogiri::HTML(open('http://toykeeper.net/programs/mad/compliments'))

  end

  def todays_praise
    praise = praise_noko_doc.xpath('//*[@id="content"]/blockquote/div/table/tbody/tr[2]/td[2]/h3').text
  end


end
