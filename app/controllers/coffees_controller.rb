class CoffeesController < ApplicationController
  before_action :set_coffee, only: %i[ show edit update destroy ]

  def index
    @coffees = Coffee.all
  end

  def show
  end

  def new
    @coffee = Coffee.new
  end

  def edit
  end

  def create
    @coffee = Coffee.new(coffee_params)

    respond_to do |format|
      if @coffee.save
        format.html { redirect_to coffee_url(@coffee), notice: "Coffee was successfully created." }
        format.json { render :show, status: :created, location: @coffee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @coffee.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @coffee.update(coffee_params)
        format.html { redirect_to coffee_url(@coffee), notice: "Coffee was successfully updated." }
        format.json { render :show, status: :ok, location: @coffee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @coffee.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @coffee.destroy!

    respond_to do |format|
      format.html { redirect_to coffees_url, notice: "Coffee was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_coffee
      @coffee = Coffee.find(params[:id])
    end

    def coffee_params
      params.require(:coffee).permit(:name, :price)
    end
end
