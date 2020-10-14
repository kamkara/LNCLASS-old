class HomeController < ApplicationController
  before_action :authenticate_user!


  def index
    if current_user.role == 'student'
      @courses = Course.where("level= ?", current_user.level)#.order("created_at")
    elsif current_user.role == "prof"
      @courses = Course.all
    end
  end
end
