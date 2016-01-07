class Conversation < ActiveRecord::Base
  belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
  belongs_to :recipient, :foreign_key => :recipient_id, class_name: 'User'

    has_many :messages, dependent: :destroy
      #conversation has many messages we are validating the
      #sender_id as uniqueness and passing a scope of receipient id conversation is not happend between two users
    validates_uniqueness_of :sender_id, :scope => :recipient_id
# it will retrive all conversations currently loged in user
    scope :involving, -> (user) do
      where("conversations.sender_id =? OR conversations.recipient_id =?",user.id,user.id)
    end
# it will check conversations are exists between two users
    scope :between, -> (sender_id,recipient_id) do
      where("(conversations.sender_id = ? AND conversations.recipient_id =?) OR (conversations.sender_id = ? AND conversations.recipient_id =?)", sender_id,recipient_id, recipient_id, sender_id)
    end
end
