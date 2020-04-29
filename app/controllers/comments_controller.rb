class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    @comment.user = current_user
    if @comment.save
      ActionCable.server.broadcast 'room_channel',
      content: @comment.content,
      commentor: @comment.user.email,
      time_commented: @comment.created_at.strftime("%d/%m/%y %H:%M")
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :video_id)
  end
end
