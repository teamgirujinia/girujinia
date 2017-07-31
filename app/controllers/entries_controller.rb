class EntriesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_request_from
    before_action :set_alart

    def create
      @project = Project.find(params[:project_id])
      @entry = @project.entries.build(project_id: @project.id, owner_id: 0, user_id: params[:user_id])
      # mail_method(@project.user, "pick", @project)
      @entry.save
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
        if @entry.save
             redirect_to show_recruit_user_path
        else
             render "show_recruit"
        end
    end
    
    ## CurrentUserが応募に対して非承認を行う
    def disapproval
        @entry = Entry.find_by(project_id: "#{params[:project_id]}", user_id: "#{params[:user_id]}")
        @entry.owner_id = 0
        if @entry.save
             redirect_to show_recruit_user_path
        else
             render "show_recruit"
        end
    end

    private
        def entry_params
          params.require(:entry).permit(:project_id, :user_id, :owner_id)
        end
        
        # どこのページからリクエストが来たか保存しておく
        def set_request_from
          if session[:request_from]
            @request_from = session[:request_from]
          end
          # 現在のURLを保存しておく
          session[:request_from] = request.original_url
        end
end
