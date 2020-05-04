require 'rails_helper'

RSpec.describe "profile_pictures/new", type: :view do
  before(:each) do
    assign(:profile_picture, ProfilePicture.new(
      caption: "MyText",
      user: nil
    ))
  end

  it "renders new profile_picture form" do
    render

    assert_select "form[action=?][method=?]", profile_pictures_path, "post" do

      assert_select "textarea[name=?]", "profile_picture[caption]"

      assert_select "input[name=?]", "profile_picture[user_id]"
    end
  end
end
