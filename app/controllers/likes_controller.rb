class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
      @project = Project.find(params[:project_id])
      @like = current_user.likes.build(project_id: @project.id)
      # mail_method(@project.user, "pick", @project)
      @like.save
  end

  def destroy
      @project = Project.find(params[:project_id])
      @like = current_user.likes.find_by!(project_id: params[:project_id])
      @like.destroy
  end
end
