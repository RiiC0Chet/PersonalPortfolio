class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]

  before_action :authenticate_user!, except: [:show]
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  # GET /projects or /projects.json
  def index
    @projects = Project.all
    authorize current_user
  end

  # GET /projects/1 or /projects/1.json
  def show
    authorize @project
  end

  # GET /projects/new
  def new
    @project = Project.new
    authorize current_user
  end

  # GET /projects/1/edit
  def edit
    authorize current_user
  end

  # POST /projects or /projects.json
  def create
    authorize current_user
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    authorize current_user
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    authorize current_user
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:title, :description, :avatar, :user_id, :experience_id, features: [], technologies: []).tap do |whitelisted|
        whitelisted[:features] = params[:project][:features].split(",").map(&:strip) if params[:project][:features]
        whitelisted[:technologies] = params[:project][:technologies].split(",").map(&:strip) if params[:project][:technologies]
      end
    end
end