require 'rails_helper'
require 'capybara/rspec'

feature "Sign up", :type => :feature do
    scenario "Root url page to profile" do
        visit "/"
        fill_in "Username", :with => "bobsmith"
        fill_in "email_signup", :with => "bob@smith.com"
        fill_in "password_signup", :with => "12345678"
        fill_in "Age", :with => 19
        click_button "Sign Up"
        expect(current_path).to eq('/')
    end
end
