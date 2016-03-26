class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    respond_to do |format|
      format.html {render :index}
      format.json {render json: @categories}
    end
    @pins = current_user.pins
  end

  # def show
  #   @category = Category.find(params[:id])
  #    respond_to do |format|
  #     format.html {render :show}
  #     format.json {render json: @category}
  #   end   
  # end

end


