class InvitationsController < ApplicationController
  def accept
    @invitation = Invitation.find(params[:id])
    @invitation.pending = false
    @user = current_user
    @group = @invitation.invitable
    if @invitation.save
      @group.users.each do |user|
        @n = Notification.new(content: @user.name + " a accepté l'invitation à rejoindre le groupe : " + @group.title, user: user, linkable: @group, view_state: false )
        @n.save
      end
      @group.users << @user
      redirect_to group_path(@group), notice: "Invitation acceptée."
    end
  end

  def refuse
    @invitation = Invitation.find(params[:id])
    @user = current_user
    @invitation.pending = false
    @group = @invitation.invitable
    if @invitation.save
      @group.users.each do |user|
        @n = Notification.new(content: @user.name + " a refusé l'invitation à rejoindre le groupe : " + @group.title, user: user, linkable: @group, view_state: false )
        @n.save
      end
      redirect_to notifications_index_path, notice: "Invitation refusée."
    end
  end
end