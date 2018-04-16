class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :private, :user
end
