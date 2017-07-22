class RecruitsController < ApplicationController
  before_action :set_Recruit, only: [:show, :new, :create, :destroy, :edit]

  def new
  end

  def show
  end

  def index
    @recruits = Recruit.all
  end

  def create
    @recruit = Recruit.new(recruit_params)

    @recruit.save
    redirect_to @article
  end

  def edit
  end

  def update
  end

  def destroy
  end



  private
    # Recruitテーブルから値をとってきて変数にいれる
    def set_Recruit
      @recruit = Recruit.find(params[:id])
    end
    # 入力カラムを記述
    def recruit_params
      params.require(:recruit).permit(:create_title, :period, :people, :content, :work_method, :communication, :wanted_jobs, :user_id).merge(user_id: current_user.id)
    end
end
