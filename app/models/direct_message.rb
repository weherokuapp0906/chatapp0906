class DirectMessage < ApplicationRecord
after_create_commit { DirectMessageBroadcastJob.perform_later self }

  belongs_to :user
  belongs_to :room
end
