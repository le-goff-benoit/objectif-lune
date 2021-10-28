class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end
  def show
    @group = Group.find(params[:id])
    @members = @group.users
  end
  def new
    @group = Group.new
  end
  def create
    @group = Group.new(params.require(:group).permit(:title, :description, :key, :goal))
    @group.users << current_user
    if @group.save
      redirect_to groups_path, notice: "Création réussie."
    else
      render 'new', status: :unprocessable_entity
    end
  end

  # Join a group
  def join
    @group = Group.new
  end

  def add
    @group = Group.find_by(key: params[:group][:key])
    if @group.present? && !current_user.in?(@group.users)
      @group.users << current_user
      redirect_to group_path(@group), notice: 'Ajout réussi'
    else
      @group = Group.new
      @group.errors.add(:key, "Inscription impossible avec la clé fournie")
      render 'join', status: :unprocessable_entity
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
      redirect_to group_path(@group), notice: "Invitation réussie"
    else
      @group = @group
      @group.errors.add(:key, "Membre introuvable ou déjà inscrit")
      render 'call', status: :unprocessable_entity
    end
  end
end
