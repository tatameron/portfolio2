class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
has_many :from_messages, class_name: "Message",
          foreign_key: "from_id", dependent: :destroy
has_many :to_messages, class_name: "Message",
          foreign_key: "to_id", dependent: :destroy
has_many :sent_messages, through: :from_messages, source: :from
has_many :received_messages, through: :to_messages, source: :to
has_many :topics
has_many :subs

attachment :profile_image
# Send message to other user
def send_message(other_user, room_id, content)
  from_messages.create!(to_id: other_user.id, room_id: room_id, content: content)
end
end
