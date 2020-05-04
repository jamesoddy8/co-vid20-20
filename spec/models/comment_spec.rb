require 'rails_helper'

RSpec.describe Comment, type: :model do
    it { is_expected.to be }

    it "makes a comment" do
        comment = Comment.create(content: "Hello")
        comment.created_at = "2020-05-04 17:47:21 +0100"
        comment.user = User.create(username: "Big boy")
        comment.content = "content"
        expect(comment.make_comment(comment)).to eq "04/05/20 16:47 Big boy said: content"
    end
end