class ApartmentAssignmentsController < ApplicationController
  before_action :set_apartment_assignment, only: [:show, :edit, :update, :destroy]

  # GET /apartment_assignments
  # GET /apartment_assignments.json
  def index
    @apartment_assignments = ApartmentAssignment.all
  end

  # GET /apartment_assignments/1
  # GET /apartment_assignments/1.json
  def show
  end

  # GET /apartment_assignments/new
  def new
    @apartment_assignment = ApartmentAssignment.new
  end

  # GET /apartment_assignments/1/edit
  def edit
  end

  # POST /apartment_assignments
  # POST /apartment_assignments.json
  def create
    @apartment_assignment = ApartmentAssignment.new(apartment_assignment_params)

    respond_to do |format|
      if @apartment_assignment.save
        format.html { redirect_to @apartment_assignment, notice: 'Apartment assignment was successfully created.' }
        format.json { render :show, status: :created, location: @apartment_assignment }
      else
        format.html { render :new }
        format.json { render json: @apartment_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apartment_assignments/1
  # PATCH/PUT /apartment_assignments/1.json
  def update
    respond_to do |format|
      if @apartment_assignment.update(apartment_assignment_params)
        format.html { redirect_to @apartment_assignment, notice: 'Apartment assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @apartment_assignment }
      else
        format.html { render :edit }
        format.json { render json: @apartment_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apartment_assignments/1
  # DELETE /apartment_assignments/1.json
  def destroy
    @apartment_assignment.destroy
    respond_to do |format|
      format.html { redirect_to apartment_assignments_url, notice: 'Apartment assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apartment_assignment
      @apartment_assignment = ApartmentAssignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apartment_assignment_params
      params.require(:apartment_assignment).permit(:bedroom, :assignment_date)
    end
end
