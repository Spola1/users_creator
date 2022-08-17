class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
    @users = User.all
  end

  def show
  end

  def home
  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
    [:password, :password_confirmation].each do |password_key|
      params[:user].delete(password_key) if params[:user][password_key].blank?
    end

    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully update.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy

    redirect_to users_path, notice: 'User was successfully destroyed.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
