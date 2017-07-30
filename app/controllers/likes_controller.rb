class LikesController < ApplicationController
  before_action :set_ransack
  before_action :authenticate_user!, only: [:create, :destroy]
  def create
    @project = Project.find(params[:project_id])

    @like = Like.new(
      project_id: params[:project_id],
      user_id: current_user.id
    )

    if @like.save
      redirect_to project_path(@project)
    else
      render template: 'project/show'
    end
  end

  def destroy
    @like = Like.find_by(project_id: params[:project_id], user_id: current_user.id)
    @like.destroy
    redirect_to project_path(params[:project_id])
  end

  private
    def like_params
      params.require(:like).permit(:project_id, :user_id)
    end
end
