# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy]
  before_action :set_user, only: [:destroy]

  def create
    @user = User.find_by(mobile: session_params[:mobile])
    if @user && @user.authenticate(session_params[:password])
      @user.set_auth_token
    else
      render json: { error: 'Invalid mobile/password combination' }, status: :unauthorized
    end
  end

  def destroy
    authorize! :destroy, @user
    @user.update_attributes(auth_token: nil)
  end

  private

  def set_user
    @user = User.find params[:id]
  end

  def session_params
    params.require(:session).permit(:mobile, :password)
  end
end
