# frozen_string_literal: true

json.user do
  json.partial! 'users/user', user: @user
  json.extract! @user, :auth_token
end
