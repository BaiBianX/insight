# frozen_string_literal: true

class ApplicationController < ActionController::API
  include RedisStore
  include CanCan::ControllerAdditions
  include ActionController::HttpAuthentication::Token::ControllerMethods

  attr_accessor :current_user

  rescue_from CanCan::AccessDenied do
    render json: { error: 'You are not authorized to access this resource.' }, statuc: 403
  end

  def authenticate_user!
    if authenticate_with_http_token { |token, _options| RedisStore.hexists(token, 'user_id') && @token = token }
      user_id = RedisStore.hmget(@token, 'user_id').first
      @current_user = User.find(user_id)
    else
      render json: { error: 'Invalid token' }, status: :unauthorized
    end
  end
end
