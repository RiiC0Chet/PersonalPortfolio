# app/controllers/users_controller.rb
class UsersController < ApplicationController
  require 'net/http'
  require 'json'

    before_action :set_user, only: [:show, :edit, :update, :destroy]
  
    before_action lambda {
      resize_before_save(user_params[:avatar], 1000, 1000)
    }, only: [:update]

    def index
      @users = User.all
    end
  
    def show
      @weather_data = fetch_weather_data
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

    def fetch_weather_data
      # URL de la API de Open-Meteo
      url = "https://api.open-meteo.com/v1/forecast?latitude=53.3331&longitude=-6.2489&hourly=temperature_2m,relative_humidity_2m,wind_speed_120m&timezone=GMT"
      
      # Realiza la solicitud HTTP
      uri = URI(url)
      response = Net::HTTP.get(uri)
      JSON.parse(response)
    end


  end