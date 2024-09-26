class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  # GET /experiences
  def index
    @experiences = Experience.all
    authorize current_user
  end

  # GET /experiences/1
  def show
    authorize @experience
  end

  # GET /experiences/new
  def new
    @experience = Experience.new
    authorize current_user
  end

  # GET /experiences/1/edit
  def edit
    authorize current_user
  end

  # POST /experiences
  def create
    authorize current_user
    @experience = Experience.new(experience_params)

    if @experience.save
      redirect_to @experience, notice: 'Experience was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /experiences/1
  def update
    authorize current_user
    if @experience.update(experience_params)
      redirect_to @experience, notice: 'Experience was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /experiences/1
  def destroy
    authorize current_user
    @experience.destroy
    redirect_to experiences_url, notice: 'Experience was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_experience
      @experience = Experience.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def experience_params
      params.require(:experience).permit(:title, :description, :avatar, :user_id)
    end
end