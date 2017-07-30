class PagesController < ApplicationController
  before_action :set_ransack
  
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
    @entries = Entry.where(owner_id: 0)
    @wanteds = []
    @entries.each do |entry|
      project = Project.find_by(id: entry.project_id)
      @wanteds.push(project)
    end
  end
  
  def doing
  end
  
  def news
  end
  
  def campaign
  end
  
end
