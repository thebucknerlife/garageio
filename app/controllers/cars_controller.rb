class CarsController < ApplicationController

  before_action :authorize

  def index
    ownerships = current_user.ownerships
    @cars = []

    ownerships.each do |ownership|
      @cars << ownership.car
    end
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
  end

  def create
    @car = Car.new(car_params) 
    if @car.save
      ownership = Ownership.new( user_id: current_user.id, car_id: @car.id )
      ownership.save

      flash[:info] = ["Car created!"]
      redirect_to '/cars'
    else
      flash[:info] = @car.errors.full_messages
      redirect_to '/cars/new'
    end
  end

  def destroy
    car = Car.find(params[:id])
    if car.destroy
      ownerships = Ownership.where(car_id: car.id)
      ownerships.destroy_all

      flash[:info] = ["Car successfully deleted!"]
      redirect_to '/cars'
    else
      flash[:info] = car.errors.full_messages
      redirect_to '/cars'
    end
  end

private

  def car_params
    params.require(:car).permit(:make, :car_model, :year)
  end
end