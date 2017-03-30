# frozen_string_literal: true

class SessionsController < ApplicationController
  include RedisStore

  before_action :authenticate_user!, only: [:destroy]
  before_action :set_user, only: [:destroy]

  def create
    @user = User.find_by(mobile: session_params[:mobile])
    if @user && @user.authenticate(session_params[:password])
      @token = gen_random_token
      @user.update_attributes(auth_token: @token)
    else
      render json: { error: 'Invalid mobile/password combination' }, status: :unauthorized
    end
  end

  def destroy
    authorize! :destroy, @user
    @user.update_attributes(auth_token: nil)
  end

  private

  def gen_random_token
    token = Digest::SHA1.hexdigest([Time.now, rand].join)
    loop do
      return token unless RedisStore.hexists(token, 'user_id')
      token = Digest::SHA1.hexdigest([Time.now, rand].join)
    end
    token
  end

  def set_user
    @user = User.find params[:id]
  end

  def session_params
    params.require(:session).permit(:mobile, :password)
  end
end
