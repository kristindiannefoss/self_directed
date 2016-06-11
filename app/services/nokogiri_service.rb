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

  # def chart_it
  #   data_table = GoogleVisualr::DataTable.new
  #
  #   # Add Column Headers
  #   data_table.new_column('string', "#{current_user.user_name}" )
  #   data_table.new_column('number', 'Sales')
  #   data_table.new_column('number', 'Expenses')
  #
  #   # Add Rows and Values
  #   data_table.add_rows([
  #       ['2004', 1000, 400],
  #       ['2005', 1170, 460],
  #       ['2006', 660, 1120],
  #       ['2007', 1030, 540]
  #   ])
  #
  #   option = { width: 400, height: 240, title: 'Company Performance' }
  #   @chart = GoogleVisualr::Interactive::AreaChart.new(data_table, option)
  # end
end
