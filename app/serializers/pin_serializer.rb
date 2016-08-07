class PinSerializer < ActiveModel::Serializer
  attributes :id, :title, :url, :text, :image
  has_many :categories, serializer: PinCategorySerializer
end
