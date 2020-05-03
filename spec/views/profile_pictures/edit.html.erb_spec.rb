require 'rails_helper'

RSpec.describe "profile_pictures/edit", type: :view do
  before(:each) do
    @profile_picture = assign(:profile_picture, ProfilePicture.create!(
      caption: "MyText",
      user: nil
    ))
  end

  it "renders the edit profile_picture form" do
    render

    assert_select "form[action=?][method=?]", profile_picture_path(@profile_picture), "post" do

      assert_select "textarea[name=?]", "profile_picture[caption]"

      assert_select "input[name=?]", "profile_picture[user_id]"
    end
  end
end
