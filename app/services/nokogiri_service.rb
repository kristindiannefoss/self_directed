require 'nokogiri'
require 'open-uri'

class NokogiriService

  attr_reader :noko_doc

  def initialize
    # require 'pry'; binding.pry
    # @user = current_user
    @noko_doc = Nokogiri::HTML(open("https://github.com/#{current_user.user_name}"))
  end

  def find_me

  end

  def todays_commits
    today = noko_doc.at("rect[data-date='#{todays_date_formatted}']")["data-count"].to_i
  end

  def todays_date_formatted
    Date.today.strftime("%F")
  end
end
