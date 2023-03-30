class MovieSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :year
end
