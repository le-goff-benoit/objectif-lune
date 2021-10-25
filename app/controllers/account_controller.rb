class AccountController < ApplicationController
  def show
    @user = current_user
    @groups = current_user.groups
  end
end
