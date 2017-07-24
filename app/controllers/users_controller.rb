class UsersController < ApplicationController
  # before_action :sign_in_required, only: [:show]

  def show
    @user = User.find(params[:id])
    @recruits = Recruit.where(:user_id => @user.id)
  end

end
