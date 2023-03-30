class DirectorSerializer < ActiveModel::Serializer
  attributes :id, :name, :age
  has_one :movie
end
