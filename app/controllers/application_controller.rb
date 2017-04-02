# frozen_string_literal: true

class ApplicationController < ActionController::API
  include CanCan::ControllerAdditions
  include ActionController::HttpAuthentication::Token::ControllerMethods

  attr_accessor :current_user

  rescue_from CanCan::AccessDenied do
    render_error 'You are not authorized to access this resource.', :unauthorized
  end

  def authenticate_user!
    authenticate || render_unauthorized
  end

  def render_error(error, status = 200)
    render json: { error: error }, status: status
  end

  protected

  def authenticate
    authenticate_with_http_token do |token, _options|
      @current_user = User.find_by(auth_token: token)
    end
  end

  def render_unauthorized
    render_error 'Invalid token', :unauthorized
  end
end
