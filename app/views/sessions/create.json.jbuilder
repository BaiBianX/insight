# frozen_string_literal: true

json.user do
  json.extract! @user, :id, :mobile, :nickname, :auth_token, :created_at, :updated_at
end
