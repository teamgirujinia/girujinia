class PagesController < ApplicationController
  before_action :set_ransack
  
  def index
    @projects = Project.all.reverse
  end
  
  def sudden
    @projects = Project.all.reverse
  end
  
  def wanted
  end
  
  def doing
  end
  
  def news
  end
  
  def campaign
  end
  
end
