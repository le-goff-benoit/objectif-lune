class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
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
    @notification = Notification.new(content: "Vous avec créé un nouveau groupe : " + @group.title, user: current_user, linkable: @group, view_state: false )
    @group.users << current_user
    if @group.save
      @notification.save
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
      @notification = Notification.new(content: "Tu as rejoins le groupe : " + @group.title, user: current_user, linkable: @group, view_state: false )
      @notification.save
      @group.users.each do |user|
        @n = Notification.new(content: current_user.name + " as rejoins le groupe : " + @group.title, user: user, linkable: @group, view_state: false )
        @n.save
      end
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
      @notification = Notification.new(content: "Tu as été invité et ajouté à un groupe : " + @group.title, user: @user, linkable: @group, view_state: false )
      @notification.save
      @group.users.each do |user|
        @n = Notification.new(content: @user.name + " as rejoins le groupe : " + @group.title, user: user, linkable: @group, view_state: false )
        @n.save
      end
      @group.users << @user
      redirect_to group_path(@group), notice: "Invitation réussie"
    else
      @group = @group
      @group.errors.add(:key, "Membre introuvable ou déjà inscrit")
      render 'call', status: :unprocessable_entity
    end
  end
end
