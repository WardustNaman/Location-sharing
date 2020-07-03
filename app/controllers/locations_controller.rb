class LocationsController < ApplicationController

  before_action :set_location, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /locations
  # GET /locations.json
  def index
    # binding.pry
     @locations = Location.where(user_id: current_user.id)
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    @location = Location.find_by(:id=> params[:id])
  end

  # GET /locations/new
  def new
    @location = Location.new
    @users = User.all
  end

  # GET /locations/1/edit
  def edit
    @location = Location.find_by(:id=> params[:id])
    @users = User.all
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(location_params)
        @location.user_id = current_user.id
        # @location.status_id = Status.first.id
      if @location.save
        if params["user_ids"]
          if !params["user_ids"].empty?
            params["user_ids"].each do |id|
              UsersLocation.create(user_id: id, location_id: @location.id)
            end
          else
          end
        end
        redirect_to location_path(@location), success: "Location is successfully created."
      else
        render action: :new, error: "Error while creating new location"
      end
    end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
        @location = Location.find_by(:id=> params[:id])
        if @location.update(location_params)
            if !params["user_ids"].empty?
                params["user_ids"].each do |id|
                    UsersLocation.create(user_id: id, location_id: @location.id)
                end
            else
            end
            flash[:success] = "Location is successfully updated."
            redirect_to location_path(@location)
        else
            flash[:error] = "Error while updating location"
            render :edit
        end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    # binding.pry 
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def location_params
      params.require(:location).permit(:status_id, :x_axis, :y_axis, user_ids:[])
    end
end

