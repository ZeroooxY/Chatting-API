class Conversation < ApplicationRecord
    belongs_to :sender, class_name: "User", foreign_key: "sender_id"
    belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"
    has_many :messages
    attribute :last_message
    attribute :unread

    # validates_uniqueness_of :sender_id, scope: :receiver_id
    
    scope :show_conversations, lambda { |sender_id|
    where('sender_id = ? OR receiver_id = ?', sender_id, sender_id).order(updated_at: :desc)}
  
    def self.show_messages(sender_id, receiver_id)
    where('(sender_id = ? AND receiver_id = ?) OR (sender_id = ? AND receiver_id = ?)', sender_id, receiver_id, receiver_id, sender_id).first
  end
end
