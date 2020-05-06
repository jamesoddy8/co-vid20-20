require 'rails_helper'
require 'sign_up_helper'
require 'create_video_helper'

RSpec.describe "Donating to user", type: :feature do 
    scenario "A user can go to another users paypal" do
        create_user_and_sign_up
        create_video
        visit "/videos"
        click_link "Sign Out"
        create_user_and_sign_up_2
        click_link "All videos"
        page.first(".video-size-for-card a").click
        expect(page).to have_selector("input")
    end
end