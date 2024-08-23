# app/controllers/users_controller.rb
class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
  
    before_action lambda {
      resize_before_save(user_params[:avatar], 500, 500)
    }, only: [:update]

    def index
      @users = User.all
    end
  
    def show
    end
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
  
      if @user.save
        redirect_to @user, notice: 'User was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @user.destroy
      redirect_to users_url, notice: 'User was successfully destroyed.'
    end
  
    private
  
    def set_user
      @user = User.find(params[:id])
    end
  
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :avatar)
    end

    def resize_before_save(image_param, width, height)
      return unless image_param

      begin
        ImageProcessing::MiniMagick
          .source(image_param)
          .resize_to_fit(width, height)
          .call(destination: image_param.tempfile.path)
      rescue StandardError => _e
        # Do nothing. If this is catching, it probably means the
        # file type is incorrect, which can be caught later by
        # model validations.
      end
    end

  end