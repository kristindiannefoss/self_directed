require 'rails_helper'

describe "InsultNokogiriService" do
  before do
    @service = InsultNokogiriService.new
    @service2 = InsultNokogiriService.new
  end

    it "gets random insult from webpage" do
        insult1 = @service.todays_insult
        insult2 = @service2.todays_insult
        expect(insult1).to be_a(String)
        expect(insult1).to_not eq(insult2)
    end

end
