class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end
  def show
    @group = Group.find(params[:id])
  end
  def new
    @group = Group.new
  end
  def create
    @group = Group.new(params.require(:group).permit(:title, :description))
    @group.users << current_user
    if @group.save!
      redirect_to groups_path
    end
  end
end
