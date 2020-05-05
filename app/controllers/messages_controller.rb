class MessagesController < ApplicationController
before_action do
  @conversation = Conversation.find(params[:conversation_id])
end

  def index
    @over_ten = false
    @messages = @conversation.messages.order(id: :asc)
    puts unread_in_conversation
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
      @messages = @conversation.messages.order(id: :asc)
      Message.all.update(read: true)

    end
    @message = @conversation.messages.new
  end

  def new
    @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(message_params)
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    end
  end

  def unread_in_conversation
    @unread = []
    @conversation.messages.each do |message|
      if message.read == false
        @unread << message
      end
    end
    # Message.all(:conditions => ["read = ?", false])
    puts '------------'
    p @unread
    # Client.first(:conditions => ["orders_count = ?", params[:orders]])
  end


  private
  def message_params
    params.require(:message).permit(:content, :user_id)
  end

end
