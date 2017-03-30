# frozen_string_literal: true

class ApplicationController < ActionController::API
  include RedisStore
  include Cancancan::ControllerAdditions

  before_action :authenticate_user!

  def authenticate_user!
    if authenticate_with_http_token { |token, _options| RedisStore.hexists(token, 'user_id') && @token = token }
      user_id = RedisStore.hmget(@token, 'user_id')
      @current_user = User.find user_id
    else
      render json: 'Invalid token', status: :unauthorized
    end
  end
end
