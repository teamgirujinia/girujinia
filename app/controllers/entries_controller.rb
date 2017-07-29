class EntriesController < ApplicationController
    before_action :authenticate_user!
    def create
    
    @project = Project.find(params[:project_id])

    @entry = @project.entries.create(entry_params)
    
        if @entry.save
             redirect_to project_path(params[:project_id])
        else
             render "show"
        end
    end

    def destroy
        @project = Project.find(params[:project_id])
        @entry = Entry.find_by(
            project_id: params[:project_id],
            user_id: current_user.id)
        @entry.destroy
        redirect_to project_path(params[:project_id])    
    end

    private
    def entry_params
      params.require(:entry).permit(:project_id, :user_id, :owner_id)
    end
end
