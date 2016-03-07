class AddUserRefToPins < ActiveRecord::Migration
  def change
    add_reference :pins, :user, index: true
    add_foreign_key :pins, :users
  end
end