class Tweet < ApplicationRecord
  has_one :attachment, as: :attachments
  belongs_to :user
end
