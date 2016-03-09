class PinCategories < ActiveRecord::Migration
  def change
    create_table :pin_categories do |t|
      t.references :pin, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
    end
  end
end
