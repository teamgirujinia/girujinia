class PicksController < ApplicationController
    before_action :authenticate_user!
  
    def create
        @project = Project.find(params[:project_id])
        @pick = current_user.picks.build(project_id: @project.id)
        # mail_method(@project.user, "pick", @project)
        @pick.save
    end
    
    
    def destroy
        @project = Project.find(params[:project_id])
        @pick = current_user.picks.find_by!(project_id: params[:project_id])
        @pick.destroy
    end
end
