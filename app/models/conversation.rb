class Conversation < ApplicationRecord

  attr_reader :unread, :output, :current_user

  belongs_to :sender, :foreign_key => :sender_id, class_name: "User"
  belongs_to :recipient, :foreign_key => :recipient_id, class_name: "User"

  has_many :messages, dependent: :destroy
  validates_uniqueness_of :sender_id, :scope => :recipient_id

  scope :between, -> (sender_id, recipient_id) do
    where("(conversations.sender_id = #{sender_id} AND conversations.recipient_id = #{recipient_id}) OR (conversations.sender_id = #{recipient_id} AND conversations.recipient_id = #{sender_id})")
  end

  def unread_in_conversation(conversation)
    @unread = []
    # @current_user = current_user
      conversation.messages.each do |message|
        if message.read == false
          # if message.user_id != current_user.id
            @unread << message
          # end
        end
      end
      @unread.length == 0 ? @output = false : @output = true
      return @output
    end

end




# scope :between, -> (sender_id,recipient_id) do
#   where(“(conversations.sender_id = ? AND conversations.recipient_id =?) OR (conversations.sender_id = ? AND conversations.recipient_id =?)”, sender_id,recipient_id, recipient_id, sender_id)
#   end