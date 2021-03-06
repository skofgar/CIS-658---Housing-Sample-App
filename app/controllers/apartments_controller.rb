class ApartmentsController < ApplicationController
  before_action :set_apartment, only: [:show, :edit, :update, :destroy]

  respond_to :html, :js


  resource_description do
    short 'This resource contains information about the current apartments registered.'
    #formats ['json']
    #error 404, "Missing"
    #error 500, "Server crashed for some <%= reason %>", :meta => {:anything => "you can think of"}
    meta :author => {:name => 'Roland', :surname => 'H'}
  end


  # GET /apartments
  # GET /apartments.json
  api!
  def index
    #@apartments = Apartment.ApartmentAssignments.where({:users => current_user.id})  # Apartment.all
    #@apartments = Apartment.Users.merge(ApartmentAssignments.users)
    #@assigned_apartments = Apartment.joins(:apartment_assignments).merge(ApartmentAssignment.where(user: current_user)).all
    available_apartments
  end

  # GET /apartments/1
  # GET /apartments/1.json
  def show
  end

  # GET /apartments/new
  def new
    @apartment = Apartment.new
  end

  # GET /apartments/1/edit
  def edit
  end

  # POST /apartments
  # POST /apartments.json
  api!
  def create
    @apartment = Apartment.new(apartment_params)
    @apartment.save!
    @apartments = available_apartments
  end

  # PATCH/PUT /apartments/1
  # PATCH/PUT /apartments/1.json
  api!
  def update
    respond_to do |format|
      if @apartment.update(apartment_params)
        format.html { redirect_to @apartment, notice: 'Apartment was successfully updated.' }
        format.json { render :show, status: :ok, location: @apartment }
      else
        format.html { render :edit }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apartments/1
  # DELETE /apartments/1.json
  api!
  def destroy
    @apartment.destroy
    respond_to do |format|
      format.html { redirect_to apartments_url, notice: 'Apartment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apartment
      @apartment = Apartment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apartment_params
      params.require(:apartment).permit(:apartment_number, :room_number, :number_of_rooms, :max_people, :is_furnished, :thumbnail)
    end

    def available_apartments
      @full_apartments = []
      @apartments = Apartment.all - @full_apartments
    end
end
