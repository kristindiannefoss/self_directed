require 'rails_helper'

describe "YodaServices" do
  it "can convert sentences" do
    VCR.use_cassette("first_sentence") do
      @service = YodaService.new
      converted = @service.speak("this is a test sentence")

      expect(converted).to eq("Test sentence, this is.  ")
    end

    VCR.use_cassette("second_sentence") do
      @service = YodaService.new
      converted = @service.speak("you should run today it is beautiful out")

      expect(converted).to eq("Beautiful out, you should run today it is.  Yeesssssss.")
    end
  end
end
