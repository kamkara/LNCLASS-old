class HomeController < ApplicationController

  before_action :authenticate_user!
  def index
    if current_user.role == "student"
      @materials = Material.all
      #@materials = Material.where("cycle= ?", all AND "cycle= ?", current_user.cycle)
      @courses = Course.where("level= ?", current_user.level)
    else current_user.role == "teacher"
      @materials = Material.all
      @courses = Course.all
    end
  end
end
