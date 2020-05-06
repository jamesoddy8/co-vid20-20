class MessagesController < ApplicationController
before_action do
  @conversation = Conversation.find(params[:conversation_id])
end
  # TO DO refactor .each loop into new method
  def index
    @messages = @conversation.messages.order(id: :asc)
    @messages.length > 10 ? @over_ten = true : @over_ten = false
    if @over_ten == true
      @messages = @messages[-10..-1]
      @messages.each do |message|
        if message.user_id != current_user.id
          Message.find(message.id).update(read: true)
        end
      end
    elsif @over_ten == false
      @messages = @conversation.messages.order(id: :asc)
      @messages.each do |message|
        if message.user_id != current_user.id
          Message.find(message.id).update(read: true)
        end
      end
    end
    if params[:m]
      @messages = @conversation.messages.order(id: :asc)
      @messages.each do |message|
        if message.user_id != current_user.id
          Message.find(message.id).update(read: true)
        end
      end
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

  private
  def message_params
    params.require(:message).permit(:content, :user_id)
  end

end
