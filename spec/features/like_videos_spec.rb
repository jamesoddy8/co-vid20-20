require 'rails_helper'
require 'sign_up_helper'
require 'create_video_helper'

RSpec.feature "like videos", type: :feature do
  scenario "user can see the likes" do
    create_user_and_sign_up
    visit "/videos"
    create_video
    click_link "Back"
    page.first(".video-size-for-card a").click
    expect(page).to have_content("Likes:")
  end

  # scenario "A user can like a video" do
  #   create_user_and_sign_up
  #   visit "/videos"
  #   create_video
  #   click_link "Back"
  #   click_link "Show"
  #   expect(page).to have_content("Likes: 1")
  # end
end