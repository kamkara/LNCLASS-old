class HomeController < ApplicationController

  before_action :authenticate_user!
  def index
    if current_user.role == "student"
      @courses = Course.where("level= ?", current_user.level)
    else current_user.role == "teacher"
      @courses = Course.all
    end
  end
end
