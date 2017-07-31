class PagesController < ApplicationController
  before_action :set_ransack
  before_action :set_home_data
  before_action :set_alart

  
  def index
    @projects = Project.all.reverse
  end
  
  # 急上昇
  # いいね / PV ?
  def sudden
    @projects = Project.all.reverse
  end

  # 募集中
  # Entryでowner_idが0のものを全て取得 → それらのEntryのproject_idに該当するプロジェクトを全て取得
  def wanted
    @wanteds = Project.where(status: 0)
  end
  
  def doing
    @doings = Project.where(status: 1)
  end
  
  def news
  end
  
  def campaign
  end
  
  
  private
  
    # Userランキング
    def set_home_data
      @users_rank = User.users_rank
      @num = 0
    end
  
end
