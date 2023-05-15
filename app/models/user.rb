class User < ApplicationRecord
    has_secure_password
    has_many :conversations, foreign_key: 'sender_id'
    has_many :conversations, foreign_key: 'receiver_id'
    has_many :messages  
    validates_presence_of :name, :email, :password_digest
    #memberi tahu harus ada nama, email dan password
end
