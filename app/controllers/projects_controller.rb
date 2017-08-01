class ProjectsController < ApplicationController
  before_action :set_ransack
  before_action :set_project, only: [:show, :destroy, :edit, :update]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def new
    @project = Project.new
  end

  # 検索結果の表示用
  def index
    # ページネーション付き
    @results = @q.result(distinct: true).page(params[:page])
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project
    else
      render 'new'
    end
  end

  def show
    @project.pv = @project.pv + 1 #pvのカウント
    @project.save!

    #関連のプロジェクトデータ
    # メイン言語が同じものを取得 → 自分以外のプロジェクトを取得 → created_at昇順で5件まで取得
    @relateds = Project.where(job_first: @project.job_first)
    # @relateds = @relateds.where.not(user_id: current_user.id)
    @relateds = @relateds.first(5)


    @like = Like.new() # 追記
    @entry = Entry.new()
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_back(fallback_location: root_path)
      # update完了後メッセージを出す
      flash[:notice] = "編集を完了しました"
    else
      render 'edit'
    end
  end

  def destroy
    @project.destroy
    redirect_to root_path
  end



  private

    # Recruitテーブルから値をとってきて変数にいれる
    def set_project
      @project = Project.find(params[:id])
    end
    # 入力カラムを記述
    def project_params
      params.require(:project).permit(:create_title, :period, :capacity, :content, :work_method, :communication, :job_first, :user_id, :job_secound, :job_third, :lang1, :lang2, :lang3, :dev_type, :tool).merge(user_id: current_user.id)
    end

end
