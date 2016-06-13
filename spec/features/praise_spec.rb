require 'rails_helper'

describe "PraiseNokogiriService" do
  before do
    @service = PraiseNokogiriService.new
    @service2 = PraiseNokogiriService.new
  end

    it "gets random praise from webpage" do
        praise1 = @service.todays_praise
        praise2 = @service2.todays_praise
        expect(praise1).to be_a(String)
        expect(praise1).to_not eq(praise2)
    end

end
