require 'rails_helper'

RSpec.describe ProfilePicture, type: :model do
  it { is_expected.to be }

  describe "associations" do
    it{ is_expected.to belong_to(:user) }
  end
end
