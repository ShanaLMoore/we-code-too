class Pin < ActiveRecord::Base
  validates_presence_of :title, :url, :text, :user_id
  has_many :pin_categories
  has_many :categories, through: :pin_categories
  belongs_to :user
  before_create :normalize_url!
  accepts_nested_attributes_for :categories, reject_if: proc { |attributes| attributes['name'].blank? }

  has_attached_file :image, styles: { medium: "300x300>"}, default_url: "http://placebear.com/300/300" 
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  def self.most_popular_category
    popular = self.group(:category_id).count

    popular.each do |key, value| 
       id = key if value == popular.values.max
    end

    if id == nil
       "unkown"
    else
      category = Category.find(@id)
      category.name
    end
  end

<<<<<<< HEAD
  def self.search(title)
     where(title: title)
  end

  def category_name=(name)
      category = Category.find_or_create_by(:name => name)
      self.categories << category unless self.categories.include? category
=======
  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      if category_attribute["name"] != ""
        category = Category.find_or_create_by(category_attribute)
        self.categories << category unless self.categories.include? category
      end
    end
>>>>>>> JS
  end

 def normalize_url!
   self.url = url.start_with?("http") ? url : "http://" + "#{url}"
end

end