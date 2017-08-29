class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # ログインしてない場合ログインページ遷移させる。
  # def after_sign_in_path_for(resource)
  #     recruits_show_path
  # end
  #
  # private
  #     def sign_in_required
  #         redirect_to new_user_session_url unless user_signed_in?
  #     end

  protected
  # devise Userデータベースに値を渡すための設定
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
    # user_name更新
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_name, :profile, :socialstyle, :facebook, :twitter, :qiita, :teratail, :git, :blog, :address, :age])
  end


    # 検索
  def set_ransack
    @q        = Project.ransack(params[:q])
    @results = @q.result(distinct: true).page(params[:page])
  end
  
  
  # お知らせ
  def set_alart
    @projects = Project.all.reverse
    # 左サイドに新着応募を表示するためのデータ
    # 自分のプロジェクトを全て取得
    # そのプロジェクトのIDが含まれる応募を取得
    @new_apps = []
    @projects.each do |project|
      new_app = Entry.find_by(project_id: project.id)
      @new_apps.push(new_app) if !new_app.nil?
    end
  end

  def rank_update
  end

end
