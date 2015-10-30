require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do

    it "should have the content 'App01'" do
      visit '/static_pages/home'
      expect(page).to have_content('App01')
    end
  end
end
