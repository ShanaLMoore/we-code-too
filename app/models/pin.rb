class Pin < ActiveRecord::Base
  validates_presence_of :title, :url, :slug, :text
  validates_uniqueness_of :slug
  belongs_to :category
  belongs_to :user

  has_attached_file :image, styles: { medium: "300x300>", thumb: "60x60>" }, default_url: "http://placebear.com/300/300" 
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  def self.most_popular_category
    popular = self.group(:category_id).count

    popular.each do |key, value| 
       @id = key if value == popular.values.max
    end

    category = Category.find(@id)

    category.name
  end
end