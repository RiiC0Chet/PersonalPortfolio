class EducationsController < ApplicationController
  before_action :set_education, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  # GET /educations
  def index
    authorize current_user
    @educations = Education.all
  end

  # GET /educations/1
  def show
    authorize @education
  end

  # GET /educations/new
  def new
    authorize current_user
    @education = Education.new
  end

  # GET /educations/1/edit
  def edit
    authorize current_user
  end

  # POST /educations
  def create
    authorize current_user
    @education = Education.new(education_params)

    if @education.save
      redirect_to @education, notice: 'Education was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /educations/1
  def update
    authorize current_user
    if @education.update(education_params)
      redirect_to @education, notice: 'Education was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /educations/1
  def destroy
    authorize current_user
    @education.destroy
    redirect_to educations_url, notice: 'Education was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_education
      @education = Education.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def education_params
      params.require(:education).permit(:title, :description, :avatar, :user_id, :average_grade, learned: []).tap do |whitelisted|
        whitelisted[:learned] = params[:education][:learned].split(",").map(&:strip) if params[:education][:learned]
      end
    end
end