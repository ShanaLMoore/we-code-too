class PinSerializer < ActiveModel::Serializer
  attributes :id, :title, :url, :text
end
