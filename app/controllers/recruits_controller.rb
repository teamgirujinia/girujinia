class RecruitsController < ApplicationController
  before_action :set_recruit, only: [:show, :destroy, :edit,]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def new
    @recruit = Recruit.new
  end

  def index
    @recruits = Recruit.all
  end

  def show
  end

  def create
    @recruit = Recruit.new(recruit_params)

    if @recruit.save
      redirect_back(fallback_location: root_path)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end



  private
    # Recruitテーブルから値をとってきて変数にいれる
    def set_recruit
      @recruit = Recruit.find(params[:id])
    end
    # 入力カラムを記述
    def recruit_params
      params.require(:recruit).permit(:create_title, :period, :people, :content, :work_method, :communication, :wanted_jobs, :user_id).merge(user_id: current_user.id)
    end
end
