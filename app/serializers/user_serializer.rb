class UserSerializer < ActiveModel::Serializer
  delegate :attributes, to: :object
end
