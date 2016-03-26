class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    respond_to do |format|
      format.html {render :index}
      format.json {render json: @categories}
    end
    @pins = Pin.all
  end
end


