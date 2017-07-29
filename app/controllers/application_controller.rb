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
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_name, :profile, :socialstyle, :facebook, :twitter, :qiita, :teratail, :git, :blog, :address])
  end

  # プロフィール変更後myページにリダイレクト
  def after_update_path_for(resource)
    user_path
  end

  # def update_resource(resource, params)
  #     resource.update_without_password(params)
  # end
  #
  # def params
  #   params(:user).permit(:user_name, :email)
  # end
end
