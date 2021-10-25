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
    @group = Group.new(params.require(:group).permit(:title, :description, :key, :goal))
    @group.users << current_user
    if @group.save!
      redirect_to groups_path, notice: "Création réussie."
    end
  end

  # Join a group
  def join
  end

  def add
    @group = Group.find_by(key: params[:key])
    if @group.present? && !current_user.in?(@group.users)
      @group.users << current_user
      redirect_to group_path(@group), notice: "Inscription au groupe réussie"
    else
      redirect_to groups_path, notice: "Aucun résultat"
    end
  end

  # Invite a member
  def call
    @group = Group.find(params[:id])
  end

  def invit
    @user = User.find_by(email: params[:group][:email])
    @group = Group.find(params[:group][:id])
    if @user.present? && !@user.in?(@group.users)
      @group.users << @user
      redirect_to group_path(@group), notice: "Membre inscrit"
    else
      redirect_to group_path(@group), notice: "Membre introuvable ou déjà inscrit"
    end
  end
end
