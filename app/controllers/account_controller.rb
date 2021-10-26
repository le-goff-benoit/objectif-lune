class AccountController < ApplicationController
  def show
    @user = current_user
    @groups = current_user.groups
  end

  def quit
    @group = Group.find(params[:id])
    @user = current_user
    @user.groups.delete(@group)
    redirect_to account_show_path, notice: "Désinscription réussie."
  end

end
