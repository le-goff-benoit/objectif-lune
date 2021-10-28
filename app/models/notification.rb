class Notification < ApplicationRecord
  belongs_to :linkable, polymorphic: true
  belongs_to :user

  def self.unseen_notifications(user)
    return user.notifications.where(:view_state => false)
  end

  def self.seen_notifications(user)
    return user.notifications.where(:view_state => true || nil)
  end
end
