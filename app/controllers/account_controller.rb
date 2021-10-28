class AccountController < ApplicationController
  def show
    @user = current_user
    @groups = current_user.groups
  end

  def quit
    @group = Group.find(params[:id])
    @user = current_user
    if @user.groups.delete(@group)
      @group.users.each do |user|
        @n = Notification.new(content: current_user.name + " a quitté le groupe : " + @group.title, user: user, linkable: @group, view_state: false )
        @n.save
      end
      redirect_to account_show_path, notice: "Désinscription réussie."
    end
  end
end
