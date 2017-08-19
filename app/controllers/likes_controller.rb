class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
      @project = Project.find(params[:project_id])
      @like = current_user.likes.build(project_id: @project.id)
      # mail_method(@project.user, "pick", @project)
      
      @like.save

      if user_signed_in?
        unless @project.user_id == current_user.id
            up_experience # いいねボタン押下後20ポイントプラス
        end
      else
        up_experience # いいねボタン押下後20ポイントプラス
      end
  end

  def destroy
      @project = Project.find(params[:project_id])
      @like = current_user.likes.find_by!(project_id: params[:project_id])
      @like.destroy

      if user_signed_in?
        unless @project.user_id == current_user.id
            down_experience # いいねボタン押下後20ポイントマイナス
        end
      else
        down_experience # いいねボタン押下後20ポイントマイナス
      end
  end

  private
    # experience_valueの数値をアップ
    def up_experience
        @project.user.experience_value = @project.user.experience_value + 20
        @project.user.save!
    end

    def down_experience
        @project.user.experience_value = @project.user.experience_value - 20
        @project.user.save!
    end

end
