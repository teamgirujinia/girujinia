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
    
    
    ## CurrentUserが応募に対して承認を行う
    def approval
        @entry = Entry.find_by(project_id: "#{params[:project_id]}", user_id: "#{params[:user_id]}")
        @entry.owner_id = params[:project_id]
        @entry.save
    end
    
    ## CurrentUserが応募に対して非承認を行う
    def disapproval
        @entry = Entry.find_by(project_id: "#{params[:project_id]}", user_id: "#{params[:user_id]}")
        @entry.owner_id = 0
        @entry.save
    end

    private
        def entry_params
          params.require(:entry).permit(:project_id, :user_id, :owner_id)
        end
end
