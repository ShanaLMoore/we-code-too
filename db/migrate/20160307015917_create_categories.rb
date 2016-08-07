class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
    end

    if Category.all.empty?
      Category.create(name: "blog")
      Category.create(name: "meetup group")
      Category.create(name: "website")
    end
  end

end