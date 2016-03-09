class Pin < ActiveRecord::Base
  validates_presence_of :title, :url, :slug, :text, :user_id
  validates_uniqueness_of :slug
  has_many :pin_categories
  has_many :categories, through: :pin_categories
  belongs_to :user
  before_create :normalize_url!

  has_attached_file :image, styles: { medium: "300x300>"}, default_url: "http://placebear.com/300/300" 
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  def self.most_popular_category
    popular = self.group(:category_id).count

    popular.each do |key, value| 
       @id = key if value == popular.values.max
    end

    if @id == nil
       "unkown"
    else
      category = Category.find(@id)
      category.name
    end
  end

  def category_name=(name)
      category = Category.find_or_create_by(:name => name)
      self.categories << category unless self.categories.include? category
  end

 def normalize_url!
   self.url = url.start_with?("http") ? url : "http://" + "#{url}"
end

end