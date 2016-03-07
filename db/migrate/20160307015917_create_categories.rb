class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
    end

    add_column :pins, :category_id, :integer, references: :categories
    add_index :pins, :category_id

    if Category.all.empty?
      Category.create(name: "blog")
      Category.create(name: "meetup group")
      Category.create(name: "website")
      Category.create(name: "unknown")
    end

    unknown_category = Category.find_by_name("unknown")
    pins = Pin.where("category_id is null")

    pins.each do |pin|
      category = Category.find_by_name(pin.resource_type)
      if category.present?
        pin.category_id = category.id
      else
        pin.category_id = unknown_category.id
      end
      pin.save
    end
  end
end