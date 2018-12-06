require 'rails_helper'
require 'capybara/rspec'


feature "Sign up", :type => :feature do
    scenario "Root url page to profile" do
        visit "/"
        fill_in "Username", :with => "cola"
        fill_in "email_signup", :with => "cola@smith.com"
        fill_in "password_signup", :with => "abcdef"
        fill_in "Age", :with => "19"
        click_button "Sign Up"
        page.html
        expect(page).to have_text("Welcome!")
    end
end