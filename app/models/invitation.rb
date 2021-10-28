class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :invitable, polymorphic: true

  def self.pending_invitations(user)
    user.invitations.where(:pending => true)
  end
end
