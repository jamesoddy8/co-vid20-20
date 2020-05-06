class ConversationsController < ApplicationController
  before_action :authenticate_user!
  # before_action do
  #   @conversation = Conversation.find(params[:conversation_id])
  # end
  
  
  def index
    @users = User.all
    @conversations = Conversation.all
  end
  
  def create
    if Conversation.between(params[:sender_id], params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
    redirect_to conversation_messages_path(@conversation)
  end
  
  # def unread_in_conversation
  #   p "-=-=-=-=-=-=-=-=-=-=-=-=-"
  #   @conversation = Conversation.find(params[:conversation_id])
  #   @unread = []
  #     @conversation.messages.each do |message|
  #       if message.read == false
  #         # if message.user_id != current_user.id
  #           @unread << message
  #         # end
  #       end
  #     end
  #   @unread.length == 0 ? @output = false : @output = true
  #   return @output
  # end
  
  private
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end


end
