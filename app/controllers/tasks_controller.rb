class TasksController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @task = Task.new
  end
  def create
    @task = Task.new(params.require(:task).permit(:title))
    @user = User.find(params[:task][:user])
    @task.user = @user unless @user.nil?
    @task.group = Group.find(params[:group_id])
    if @task.save
      @notification = Notification.new(content: "Une nouvelle tâche t'a été assignée : " + @task.title + " pour le groupe " + @task.group.title, user: @user, linkable: @task.group, view_state: false )
      @notification.save
      redirect_to group_path(@task.group)
    end
  end

  def complete
    @task = Task.find(params[:id])
    @task.state = true
    if @task.save
      @task.group.users.each do |user|
        @n = Notification.new(content: "La tâche " + @task.title + " a été clôturé pour le groupe : " + @task.group.title, user: user, linkable: @task.group, view_state: false )
        @n.save
      end
      redirect_to group_path(@task.group)
    end
  end
end