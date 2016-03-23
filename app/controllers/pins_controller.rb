class PinsController < ApplicationController
  
  def index
    @pins = current_user.pins
    respond_to do |format|
      format.html {render :index}
      format.json {render json: @pins}
    end
    # @pins = Pin.search("Girl Develop It")
  end

  def new
    @pin = Pin.new
  end
  
  def show
    @pin = Pin.find(params[:id])
     respond_to do |format|
      format.html {render :show}
      format.json {render json: @pin}
    end   
  end

  def create
    @pin = Pin.new(pin_params)
    @pin.user_id = current_user.id

    if @pin.valid?
      @pin.save
      redirect_to pin_path(@pin)
    else
      @errors = @pin.errors
      render :new
    end
  end

  def edit
    @pin = Pin.find(params[:id])
  end

  def update
    @pin = Pin.find(params[:id])

    if @pin.update(pin_params)
      redirect_to @pin
    else
      @errors = @pin.errors
      render :edit
    end
  end

  def destroy
    @pin = Pin.find(params[:id])
    @pin.destroy!
    redirect_to pins_path
  end

  def show_by_name
    @pin = Pin.find_by_slug(params[:slug])
    render :show
  end

  private

  def pin_params
    params.require(:pin).permit(:title, :url,:text, :category_name, :image, :user_id)
  end
  
end