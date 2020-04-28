class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
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
