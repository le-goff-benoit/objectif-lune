class GroupsController < ApplicationController
  def index
    @my_groups = current_user.groups
    @free_groups = Group.get_free_groups(current_user)
  end
  def show
    @group = Group.find(params[:id])
  end
  def new
    @group = Group.new
  end
  def create
    @group = Group.new(params.require(:group).permit(:title, :description, :key))
    @group.users << current_user
    if @group.save!
      redirect_to groups_path
    end
  end
  def join

  end
  def add
    @group = Group.find_by(key: params[:key])
    if @group.present? & !current_user.in?(@group.users)
      @group.users << current_user
      redirect_to group_path(@group)
    else
      redirect_to groups_path
    end
  end
end
