class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    @pins = Pin.all
  end
end


