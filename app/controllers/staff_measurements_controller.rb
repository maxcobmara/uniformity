class StaffMeasurementsController < ApplicationController
  before_action :set_staff_measurement, only: [:show, :edit, :update, :destroy]

  # GET /staff_measurements
  # GET /staff_measurements.json
  def index
    @staff_measurements = StaffMeasurement.all
  end

  # GET /staff_measurements/1
  # GET /staff_measurements/1.json
  def show
  end

  # GET /staff_measurements/new
  def new
    @staff_measurement = StaffMeasurement.new
  end

  # GET /staff_measurements/1/edit
  def edit
  end

  # POST /staff_measurements
  # POST /staff_measurements.json
  def create
    @staff_measurement = StaffMeasurement.new(staff_measurement_params)

    respond_to do |format|
      if @staff_measurement.save
        format.html { redirect_to @staff_measurement, notice: (t 'staff_measurements.title')+(t 'actions.created')}
        format.json { render action: 'show', status: :created, location: @staff_measurement }
      else
        format.html { render action: 'new' }
        format.json { render json: @staff_measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /staff_measurements/1
  # PATCH/PUT /staff_measurements/1.json
  def update
    respond_to do |format|
      if @staff_measurement.update(staff_measurement_params)
        format.html { redirect_to @staff_measurement, notice: (t 'staff_measurements.title')+(t 'actions.updated')}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @staff_measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staff_measurements/1
  # DELETE /staff_measurements/1.json
  def destroy
    @staff_measurement.destroy
    respond_to do |format|
      format.html { redirect_to staff_measurements_url, notice: (t 'staff_measurements.title')+(t 'actions.removed') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff_measurement
      @staff_measurement = StaffMeasurement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def staff_measurement_params
      params.require(:staff_measurement).permit(:staff_id, :uniform_id, :measurement_type, :value, :unit_type_id)
    end
end
