class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    @comment.video_id = params[:video_id]
    @comment.user = current_user
    if @comment.save
      ActionCable.server.broadcast 'room_channel',
      content: @comment.content
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
