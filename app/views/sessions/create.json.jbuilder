json.user do
  json.extract! @user, :id, :mobile, :nickname, :created_at, :updated_at
end

json.session do
  json.token @token
end
