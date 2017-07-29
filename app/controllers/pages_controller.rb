class PagesController < ApplicationController
  before_action :set_ransack
  
  def index
    @projects = Project.all.reverse
  end
end
