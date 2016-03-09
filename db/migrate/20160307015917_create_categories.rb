class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
    end

    add_column :pins, :category_id, :integer, references: :categories
    add_index :pins, :category_id

      Category.create(name: "blog")
      Category.create(name: "meetup group")
      Category.create(name: "website")
      Category.create(name: "unknown")


  end
end