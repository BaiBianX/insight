# frozen_string_literal: true

class ApplicationController < ActionController::API
  include CanCan::ControllerAdditions
  include ActionController::HttpAuthentication::Token::ControllerMethods

  attr_accessor :current_user

  rescue_from CanCan::AccessDenied do
    render json: { error: 'You are not authorized to access this resource.' }, statuc: 403
  end

  def authenticate_user!
    authenticate || render_unauthorized
  end

  protected

  def authenticate
    authenticate_with_http_token do |token, _options|
      @current_user = User.find_by(auth_token: token)
    end
  end

  def render_unauthorized
    render json: { error: 'Invalid token' }, status: :unauthorized
  end
end
