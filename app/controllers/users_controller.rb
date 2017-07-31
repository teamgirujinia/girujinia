class UsersController < ApplicationController
  # before_action :sign_in_required, only: [:show]
  before_action :set_ransack
  before_action :set_user
  before_action :set_alart

  def show
  end
  
  def show_recruit
  end
  
  def show_entry
  end
  
  def show_member
  end
  
  def show_pick
  end
  
      private

        # Userテーブルから値をとってきて変数にいれる
        # 後でmodelに移行!
        def set_user
          @user = User.find(params[:id])
          @user_projects = Project.where(:user_id => @user.id)
          # 右サイドのソーシャルスタイルカードを表示するデータ
          @socialstyle = Socialstyle.find_by(name: @user.socialstyle)
          
          # 右サイドの人気の記事を表示するデータ
          # いいねがついてるプロジェクトを取得
          # いいねがついてるプロジェクトを日付が新しい順に5件まで取得
          @populars = []
          @user_projects.each do |project|
            if project.likes.count > 0
              @populars.push(project)
            end
          end
          @populars = @populars.first(5)
          
          # 左サイドに新着応募を表示するためのデータ
          # 自分のプロジェクトを全て取得
          # そのプロジェクトのIDが含まれる応募を取得
          @new_apps = []
          @user_projects.each do |project|
            new_app = Entry.find_by(project_id: project.id)
            @new_apps.push(new_app) if !new_app.nil? && new_app.status == 0
          end
          
          
          # 採用データ
          # 自分のプロジェクトを全て取得
          # そのプロジェクトのIDが含まれる応募 & ステータスが0(承認非承認の可否なし)を取得
          @recruit_projects = []
          @user_projects.each do |project|
            recruit_project = Entry.find_by(project_id: project.id)
            @recruit_projects.push(recruit_project) if !recruit_project.nil? && recruit_project.status == 0 && recruit_project.owner_id == 0
          end
          
          # 自分のIDが含まれるエントリーを全て取得
          # エントリーのプロジェクトIDからプロジェクトを取得
          @entring_projects = []
          @my_entries = Entry.where(user_id: @user.id)
          @my_entries.each do |entry|
            project = Project.find_by(id: entry.project_id)
            @entring_projects.push(project)
          end
          
          # メンバーの取得
          @members = Entry.where(owner_id: @user.id, status: 1)
          
          # ピックしたプロジェクトを表示
          # 
          @picks = @user.pick_projects
        end

end
