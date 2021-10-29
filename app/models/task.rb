class Task < ApplicationRecord
  belongs_to :group
  belongs_to :user

  after_create_commit { broadcast_prepend_to(self.group, :tasks) }
  after_update_commit { broadcast_remove_to(self.group, :tasks, self) }
end
