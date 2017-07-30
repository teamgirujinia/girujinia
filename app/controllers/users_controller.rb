class UsersController < ApplicationController
  # before_action :sign_in_required, only: [:show]
  before_action :set_ransack

  def show
    @user = User.find(params[:id])
    @projects = Project.where(:user_id => @user.id)
    
    # 右サイドのソーシャルスタイルカードを表示するデータ
    @socialstyle = Socialstyle.find_by(name: @user.socialstyle)
    
    # 右サイドの人気の記事を表示するデータ
    # いいねがついてるプロジェクトを取得
    # いいねがついてるプロジェクトを日付が新しい順に5件まで取得
    @populars = []
    @projects.each do |project|
      if project.likes.count > 0
        @populars.push(project)
      end
    end
    @populars = @populars.first(5)
  end

end
