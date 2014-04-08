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
      ownership = Ownership.new
      ownership.car = @car
      ownership.user = current_user
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
      ownership = Ownership.where(car_id: car.id, user_id: current_user.id)
      ownership.first.destroy if ownership
      flash[:info] = ["Car destroyed!"]
      redirect_to '/cars'
    else
      flash[:info] = @car.errors.full_messages
      redirect_to '/cars'
    end
  end

private

  def car_params
    params.require(:car).permit(:make, :car_model, :year)
  end
end