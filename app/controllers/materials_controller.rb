class MaterialsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_material, only: [:show, :edit, :update, :destroy]

  # GET /materials
  def index
    @materials = Material.all
  end

  # GET /materials/1
  def show
    @materials = Material.all#where(level= ?", current_user.level)
    @courses = Course.where('material_id = ?', @material.id)
  end

  # GET /materials/new
  def new
    @material = Material.new
  end

  # GET /materials/1/edit
  def edit
  end

  # POST /materials
  def create
    @material = current_user.materials.build(material_params)

    if @material.save
      redirect_to @material, notice: 'Material was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /materials/1
  def update
    if @material.update(material_params)
      redirect_to @material, notice: 'Material was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /materials/1
  def destroy
    @material.destroy
    redirect_to materials_url, notice: 'Material was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material
      @material = Material.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def material_params
      params.require(:material).permit(:title, :cycle, :slug, :user_id, :course_id)
    end
end
