class Follower < ApplicationRecord
  belongs_to :user
  belongs_to :followed_by , :class_name => "User", foreign_key: "user_id"
end
