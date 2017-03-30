# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i(show update destroy)

  def index
    @users = User.all

    render json: @users
  end

  def show; end

  def create
    @user = User.new(user_params)
    return if @user.save

    render json: @user.errors, status: :unprocessable_entity
  end

  def update
    return if @user.update(user_params)
    render json: @user.errors, status: :unprocessable_entity
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:mobile, :password, :password_confirmation, :nickname)
  end
end
