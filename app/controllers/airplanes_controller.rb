class AirplanesController < ApplicationController
  def index
    @airplanes = Airplane.all
  end

  def show
    @airplane = Airplane.find(params[:id])
  end

  def create
    @airplane = Airplane.new(airplane_params)

    respond_to do |format|
      if @airplane.save
        format.html { redirect_to @airplane, notice: 'Horse was successfully created.' }
        format.json { render :show, status: :created, location: @airplane }
      else
        format.html { render :new }
        format.json { render json: @airplane.errors, status: :unprocessable_entity }
      end
    end
  end

end
