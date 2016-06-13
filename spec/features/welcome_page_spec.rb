require 'rails_helper'

describe 'root welcome' do

    it "displays welcome page" do
      visit root_path

      expect(page).to have_content("Tough Love")
    end

end
