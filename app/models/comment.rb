class Comment < ApplicationRecord
  belongs_to :user

  def make_comment(comment)
     comment.created_at.strftime("%d/%m/%y %H:%M") + ' ' + comment.user.email + ' said: ' + comment.content 
  end
end
