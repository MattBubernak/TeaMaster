class IngredientMeasurementsController < ApplicationController
  before_action :set_ingredient_measurement, only: [:show, :edit, :update, :destroy]

  # GET /ingredient_measurements
  # GET /ingredient_measurements.json
  def index
    @ingredient_measurements = IngredientMeasurement.all
  end

  # GET /ingredient_measurements/1
  # GET /ingredient_measurements/1.json
  def show
  end

  # GET /ingredient_measurements/new
  def new
    @ingredient_measurement = IngredientMeasurement.new
  end

  # GET /ingredient_measurements/1/edit
  def edit
  end

  # POST /ingredient_measurements
  # POST /ingredient_measurements.json
  def create
    @ingredient_measurement = IngredientMeasurement.new(ingredient_measurement_params)

    respond_to do |format|
      if @ingredient_measurement.save
        format.html { redirect_to @ingredient_measurement, notice: 'Ingredient measurement was successfully created.' }
        format.json { render :show, status: :created, location: @ingredient_measurement }
      else
        format.html { render :new }
        format.json { render json: @ingredient_measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ingredient_measurements/1
  # PATCH/PUT /ingredient_measurements/1.json
  def update
    respond_to do |format|
      if @ingredient_measurement.update(ingredient_measurement_params)
        format.html { redirect_to @ingredient_measurement, notice: 'Ingredient measurement was successfully updated.' }
        format.json { render :show, status: :ok, location: @ingredient_measurement }
      else
        format.html { render :edit }
        format.json { render json: @ingredient_measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredient_measurements/1
  # DELETE /ingredient_measurements/1.json
  def destroy
    @ingredient_measurement.destroy
    respond_to do |format|
      format.html { redirect_to ingredient_measurements_url, notice: 'Ingredient measurement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient_measurement
      @ingredient_measurement = IngredientMeasurement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ingredient_measurement_params
      params.fetch(:ingredient_measurement, {})
    end
end
