class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :description

  belongs_to :movie
end
