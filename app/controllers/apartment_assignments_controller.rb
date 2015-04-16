class ApartmentAssignmentsController < ApplicationController
  before_action :set_apartment_assignment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  resource_description do
    short 'This resource contains information about the current assignments of apartments to user. This resource provides confidential information.'
  end



  # GET /apartment_assignments
  # GET /apartment_assignments.json
  api!
  def index
    #raise ApartmentAssignment.where( { user_id: current_user.id} ).inspect
    @apartment_assignments = ApartmentAssignment.where( { user_id: current_user.id} ) #ApartmentAssignment.all
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
  api!
  def create
    #raise apartment_assignment_params.inspect
    @apartment_assignment = ApartmentAssignment.new(apartment_assignment_params)
    @apartment_assignment[:assignment_date] = Time.new
    @assigned_apartments = Apartment.joins(:apartment_assignments).merge(Apartment.where(id: @apartment_assignment.apartment)).all
    @apartment = Apartment.find(@apartment_assignment.apartment_id)

    if @assigned_apartments.count >= @apartment.max_people
      format.html { render :new }
      format.json { render json: @apartment_assignment.errors, status: :gone }
    end

    @apartment_assignment[:bedroom] = (@assigned_apartments.count+65).chr
    #byebug
    #raise @apartment_assignment.inspect

    #user = User.find(apartment_assignment_params[:user_id])

    #@apartment_assignment.build_user(:id => user.id)

    #apartment = Apartment.find(apartment_assignment_params[:apartment_id])

    #@apartment_assignment.build_apartment(:id => apartment.id)

    #logger.warning('blubb')
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
  api!
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
  api!
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
      params.require(:apartment_assignment).permit(:id, :user_id, :assignment_date, :apartment_id)

      #params[:apartment_assignment][:assignment_date] = Time.new
      #raise params.inspect

      #params

    end
end
