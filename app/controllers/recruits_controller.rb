class RecruitsController < ApplicationController
  before_action :set_recruit, only: [:show, :destroy, :edit, :update]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def new
    @recruit = Recruit.new
  end

  def index
    @recruits = Recruit.all
  end

  def create
    @recruit = Recruit.new(recruit_params)

    if @recruit.save
      redirect_to @recruit
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @recruit.update(recruit_params)
      redirect_back(fallback_location: show_users_path)
    else
      render 'edit'
    end
  end

  def destroy
    @recruit.destroy

    redirect_back(fallback_location: root_path)
  end



  private
    # Recruitテーブルから値をとってきて変数にいれる
    def set_recruit
      @recruit = Recruit.find(params[:id])
    end
    # 入力カラムを記述
    def recruit_params
      params.require(:recruit).permit(:create_title, :period, :people, :contents, :work_method, :communication, :wanted_jobs, :user_id).merge(user_id: current_user.id)
    end
end
