require 'rails_helper'

RSpec.describe "profile_pictures/show", type: :view do
  before(:each) do
    @profile_picture = assign(:profile_picture, ProfilePicture.create!(
      caption: "MyText",
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
