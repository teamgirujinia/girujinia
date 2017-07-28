class CommentsController < ApplicationController
  before_action :authenticate_user!
  # projectに対するコメントを作成
  def create
    @project = Project.find(params[:project_id]) # idを検索して標識につめる
    @comment = @project.comments.create(comment_params) 
    redirect_to project_path(@project)
  end
  # コメントを削除する設定
  def destroy
    @project = Project.find(params[:project_id]) # idを検索して標識につめる
    @comment = @project.comments.find(params[:id])
    @comment.destroy
    redirect_to project_path(@project)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:user_id, :content).merge(:user_id => current_user.id)
    end
    
end
