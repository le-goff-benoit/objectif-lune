class Channel < ApplicationRecord
  belongs_to :task, optional: true
  belongs_to :group
  has_many :messages
end
