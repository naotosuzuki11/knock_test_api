class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :username, :first_name, :last_name, :created_at, :updated_at, :last_login
end
