class EntriesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_request_from
    before_action :set_alart

    def create
      @project = Project.find(params[:project_id])
      @entry = @project.entries.build(project_id: @project.id, owner_id: 0, user_id: params[:user_id])
      @entry.pairs = params[:user_id].to_s + @project.user.id.to_s + @project.id.to_s
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
    
    ## ---------------------------------------------------------------------------------------------------
    
    ## 承認

    ## ---------------------------------------------------------------------------------------------------
    
    def approval
        puts 1
        @entry = Entry.find_by(project_id: "#{params[:project_id]}", user_id: "#{params[:user_id]}")
        puts 2
        @entry.owner_id = params[:owner_id]
        puts 3
        @entry.status = 1
        puts 4
        if @entry.save
        puts 5
             # 応募の制限
             @project = Project.find_by(id: params[:project_id])
        puts 6
             @entries = Entry.where(project_id: params[:project_id], status: 1)
        puts 7
             if @project.capacity == @entries.count
        puts 8
                 @project.status = 1
                 if @project.save
        puts 9
                 end
             end
             redirect_to show_recruit_user_path
        else
             render "show_recruit"
        end
    end
    
    ## ---------------------------------------------------------------------------------------------------
    
    ## 非承認

    ## ---------------------------------------------------------------------------------------------------
    
    def disapproval
        @entry = Entry.find_by(project_id: "#{params[:project_id]}", user_id: "#{params[:user_id]}")
        @entry.status = 2
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
