class CarsController < ApplicationController

  before_action :authorize

  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      flash[:info] = ["Car created!"]
      redirect_to '/cars'
    else
      flash[:info] = @car.errors.full_messages
      redirect_to '/cars/new'
    end
  end

private

  def car_params
    params.require(:car).permit(:make, :car_model, :year)
  end
end