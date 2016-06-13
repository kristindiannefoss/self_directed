require 'nokogiri'
require 'open-uri'

class NokogiriService

  attr_reader :noko_doc

  def initialize(user)
    @noko_doc = Nokogiri::HTML(open("https://github.com/#{user.user_name}"))
  end

  def todays_commits
    today = noko_doc.at("rect[data-date='#{todays_date_formatted}']")["data-count"].to_i
  end

  def todays_date_formatted
    Date.today.strftime("%F")
  end

end
