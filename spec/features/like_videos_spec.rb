require 'rails_helper'
require 'sign_up_helper'
require 'create_video_helper'

RSpec.feature "like videos", type: :feature do
  scenario "user can see the likes" do
    create_user_and_sign_up
    visit "/videos"
    create_video
    click_link "Back"
    click_link "Show"
    # click_on(class: "fa fa-thumbs-up")
    # page.execute_script('$.find(".fa fa-thumbs-up")[0].click()')
    expect(page).to have_content("Likes:")
  end
end