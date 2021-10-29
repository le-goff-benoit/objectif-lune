class Message < ApplicationRecord
  belongs_to :channel
  belongs_to :user

  has_rich_text :text

  after_create_commit { broadcast_prepend_to(self.channel, :messages) }

end
