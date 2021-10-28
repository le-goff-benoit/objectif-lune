class Task < ApplicationRecord
  belongs_to :group

  after_create_commit { broadcast_prepend_to(self.group, :tasks) }

end
