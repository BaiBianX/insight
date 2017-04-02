# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i(show update destroy)
  before_action :authenticate_user!, only: :update

  def index
    @users = User.all
    render json: @users
  end

  def show; end

  def create
    @user = User.new(user_params)
    return if @user.save
    render_error @user.errors.full_messages
  end

  def update
    authorize! :update, @user
    return if @user.update(user_params)
    render_error @user.errors.full_messages
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:mobile, :password, :nickname)
  end
end
