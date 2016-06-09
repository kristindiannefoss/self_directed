# require 'rails_helper'
#
# RSpec.feature "GithubServices", type: :feature do
#   pending "add some scenarios (or delete) #{__FILE__}"
# end

require 'rails_helper'

describe 'WeatherService' do


  context "info" do
    it "brings in weather info" do
      VCR.use_cassette("weather info") do
        @service = WeatherService.new
        weather_info = @service.info("Denver")

        expect(weather_info[:main][:temp]).to eq("292.59")
      end
    end
  end

end
