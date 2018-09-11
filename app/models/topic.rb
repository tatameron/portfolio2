class Topic < ApplicationRecord
  has_many :posts
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
end