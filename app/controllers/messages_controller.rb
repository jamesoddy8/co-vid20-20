class MessagesController < ApplicationController
before_action do
  @conversation = Conversation.find(params[:conversation_id])
end

  def index
    # @messages = Message.find(:all, :order => "id desc", :limit => 5)
    @messages = @conversation.messages.order(id: :asc)
    if @messages.length > 10
      @over_ten = true
      @messages = @messages[-10..-1]
      # This only updates read status for last ≤10 messages
      @messages.each do |message|
        if message.user_id != current_user.id
          Message.find(message.id).update(read: true)
        end
      end
    end
    if params[:m]
      @over_ten = false
      @messages = @conversation.messages.order(id: :asc)
      Message.all.update(read: true)
      # Message.find(@messages).update(read: true)

    end
    # if @messages.last
    #   if @messages.last.user_id != current_user.id
    #     # find a way to change more than last
    #     Message.find(@messages.last.id).update(read: true)
    #   end
    # end
    @message = @conversation.messages.new
  end

  def new
    @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(message_params)
    if @message.save
      ActionCable.server.broadcast 'messages_channel',
      content: @message.content,
      user: @message.user.username,
      message_sent: @message.created_at.strftime("%d/%m/%y %H:%M")
    end
  end

  private
  def message_params
    params.require(:message).permit(:content, :user_id)
  end

end
