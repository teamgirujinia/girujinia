class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  # devise Userデータベースに値を渡すための設定
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
    end

  # ログインしてない場合ログインページ遷移させる。
  # def after_sign_in_path_for(resource)
  #     recruits_show_path
  # end
  #
  # private
  #     def sign_in_required
  #         redirect_to new_user_session_url unless user_signed_in?
  #     end
end
