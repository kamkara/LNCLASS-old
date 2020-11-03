class ExercicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course, only: [:new, :index, :create]
  before_action :set_exercice, only: [:show, :edit, :update, :destroy]

  # POST /exercices
  def create
    @exercice = @course.exercices.build(exercice_params)
    @exercice.user_id = current_user.id
    @exercice.author = current_user.username
    @exercice.material_id = @course.material_id


    if @exercice.save
      format.html { redirect_to @course }
      format.js {} # renders create.js.erb
    else
      render :new
    end
  end



  # GET /exercices
  def index
    @exercices = Exercice.all
  end

  # GET /exercices/1
  def show
  end

  # GET /exercices/new
  def new
    @exercice = Exercice.new
  end

  # GET /exercices/1/edit
  def edit
  end


  # PATCH/PUT /exercices/1
  def update
    if @exercice.update(exercice_params)
      redirect_to @exercice, notice: 'Exercice was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /exercices/1
  def destroy
    @exercice.destroy
    redirect_to exercices_url, notice: 'Exercice was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercice
      @exercice = Exercice.friendly.find(params[:id])
    end

   def set_course
    @course = Course.friendly.find(params[:course_id])
   end

    # Only allow a trusted parameter "white list" through.
    def exercice_params
      params.require(:exercice).permit(:title, :content_exercice, :material )
    end
end
