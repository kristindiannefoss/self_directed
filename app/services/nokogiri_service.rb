require 'nokogiri'
require 'open-uri'

class NokogiriService

  attr_reader :noko_doc

  def initialize
    @noko_doc = Nokogiri::HTML(open('https://github.com/kristindiannefoss'))
  end

  def todays_commits
    today = noko.noko_doc.at('rect[data-date="2016-06-07"]')["data-count"]
    # today =  noko_doc.xpath('//*[@id="contributions-calendar"]/div[1]/svg/g/g[53]/rect[4]').first.attributes["data-count"].value
    # binding.pry
  end

  def format_date(date)
    
  end
end
#
# week_days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday". "Friday", "Saturday"]
#
# Date.today

# method to get todays date then pass it in, test separately
