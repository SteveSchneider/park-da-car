class VehiclesController < ApplicationController
  before_action :set_vehicle, only: %i[ show edit update destroy ]

  # GET /vehicles or /vehicles.json
  def index
    @vehicles = Vehicle.all
  end

  # GET /vehicles/1 or /vehicles/1.json
  def show
  end

  # GET /search
  def search
    @vehicle = Vehicle.new
  end

  # POST /vehicles/new_from_api
  def new_from_api
    respond_to do |format|
      format.html do
        vin = vehicle_params[:vin]
        v = Vehicle.find_by(vin: vin)
        redirect_to edit_vehicle_url(v) and return if v #check database for vehicle and edit if exists

        response = VehicleApi.decode_vin(vin)
        if response.present? && vin == response["VIN"]
          @vehicle = build_vehicle_from_api(response)
          redirect_to edit_vehicle_url(@vehicle) if @vehicle.save(validate: false)
        else
          flash[:error] = "VIN did not match API result"
          redirect_to search_url, status: :not_found
        end
      end
    end
  end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
  end

  # GET /vehicles/1/edit
  def edit
  end

  # POST /vehicles or /vehicles.json
  def create
    @vehicle = Vehicle.new(vehicle_params)

    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to vehicle_url(@vehicle), notice: "Vehicle was successfully created." }
        format.json { render :show, status: :created, location: @vehicle }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicles/1 or /vehicles/1.json
  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html { redirect_to vehicle_url(@vehicle), notice: "Vehicle was successfully updated." }
        format.json { render :show, status: :ok, location: @vehicle }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1 or /vehicles/1.json
  def destroy
    @vehicle.destroy

    respond_to do |format|
      format.html { redirect_to vehicles_url, notice: "Vehicle was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vehicle_params
      params.require(:vehicle).permit(:vin, :year, :make, :model, :owner_id, :facility_id)
    end

    def build_vehicle_from_api(response)
      Vehicle.new(vin: response["VIN"], year: response["ModelYear"], make: response["Make"], model: response["Model"])
    end
end
