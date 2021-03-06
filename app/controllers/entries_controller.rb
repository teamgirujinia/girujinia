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
      
      if user_signed_in?
        unless @project.user_id == current_user.id
            # 応募の受信者に1ポイントプラス
            @project.user.experience_value = @project.user.experience_value + 1 
            @project.user.save!
            # 応募者に1ポイントプラス
            current_user.experience_value = experience_value + 1
            current_user.save!
        end
      end
    end

    def destroy
        @entry = Entry.find_by(projec_id: params[:project_id], user_id: current_user.id)
        @entry.destroy
        redirect_to project_path(params[:project_id])
     
        if user_signed_in?
            unless @project.user_id == current_user.id
                # 応募の受信者に1ポイントマイナス
                @project.user.experience_value = @project.user.experience_value - 1 
                @project.user.save!
                # 応募者に1ポイントマイナス
                current_user.experience_value = experience_value - 1
                current_user.save!
            end
          end
    end
    
    ## ---------------------------------------------------------------------------------------------------
    
    ## 承認

    ## ---------------------------------------------------------------------------------------------------
    
    def approval
        @entry = Entry.find_by(project_id: "#{params[:project_id]}", user_id: "#{params[:user_id]}")
        @entry.owner_id = params[:owner_id]
        @entry.status = 1
        if @entry.save
             # 応募の制限
             @project = Project.find_by(id: params[:project_id])
             @entries = Entry.where(project_id: params[:project_id], status: 1)
             if @project.capacity == @entries.count
                 @project.status = 1
                 if @project.save
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
