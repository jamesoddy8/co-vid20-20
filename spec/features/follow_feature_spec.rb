require 'rails_helper'
require 'sign_up_helper'
require 'create_video_helper'

RSpec.describe "Following a user", type: :feature do
    scenario "a user can follow another user" do
        create_user_and_sign_up
        create_video
        visit "/videos"
        click_link "Sign Out"
        create_user_and_sign_up_2
        visit "/videos"
        page.first(".video-size-for-card a").click
        click_button 'Follow'
        visit "/videos"
        page.first(".video-size-for-card a").click
        expect(page).to have_selector(:link_or_button, 'Unfollow')
    end

    scenario "a user can unfollow another user" do
        create_user_and_sign_up
        create_video
        visit "/videos"
        click_link "Sign Out"
        create_user_and_sign_up_2
        visit "/videos"
        page.first(".video-size-for-card a").click
        click_button 'Follow'
        visit "/videos"
        page.first(".video-size-for-card a").click
        click_button 'Unfollow'
        visit "/videos"
        page.first(".video-size-for-card a").click
        expect(page).to have_selector(:link_or_button, 'Follow')
    end
end
