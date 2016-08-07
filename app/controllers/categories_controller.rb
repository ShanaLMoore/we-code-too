class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    respond_to do |format|
      format.html {render :index}
      format.json {render json: @categories}
    end
    @pins = current_user.pins
  end

  def show
    @category = Category.find(params[:id])
     respond_to do |format|
      format.html {render :show}
      format.json {render json: @category}
    end   
  end

  def create
    @category = Category.create(pin_params)
    # @pin = @pin.categories.build(name: params[:name])
    render json: @pin, status: 201
  end


end


private

  def pin_params
    params.require(:pin).permit(:title, :url, :text, :user_id, :image, category_ids:[], categories_attributes: [:name] )
  end