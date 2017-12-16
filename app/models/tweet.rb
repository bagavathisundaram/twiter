class Tweet < ApplicationRecord
  belongs_to :attachment, optional: true
  belongs_to :user
end
