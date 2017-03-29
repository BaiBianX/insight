class SessionsController < ApplicationController
  include RedisStore

  def create
    mobile = session_params[:mobile]
    password = session_params[:password]
    user = User.find_by(mobile: mobile)

    if user && user.authenticate(password)
      token = 11111
      RedisStore.expire(token, 30.days)
      @user = user
      @token = 111
    else
      render json: { error: 'Invalid mobile/password combination.' }, status: :unauthorized
    end
  end

  def destroy; end

  private

  def session_params
    params.require(:session).permit(:mobile, :password)
  end
end
