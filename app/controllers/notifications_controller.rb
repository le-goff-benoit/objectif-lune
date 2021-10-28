class NotificationsController < ApplicationController
  def index
    @unseen_notifications = Notification.unseen_notifications(current_user).order('created_at desc')
    @notifications = Notification.seen_notifications(current_user).limit(5).order('created_at desc')
    @invitations = Invitation.pending_invitations(current_user).order('created_at desc')
  end

  def seen
    @notification = Notification.find(params[:id])
    @notification.view_state = true
    if @notification.save
      redirect_to notifications_index_path
    end
  end
end