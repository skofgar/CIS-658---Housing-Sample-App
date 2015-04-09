require 'test_helper'

class ApartmentAssignmentsControllerTest < ActionController::TestCase
  setup do
    @apartment_assignment = apartment_assignments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:apartment_assignments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create apartment_assignment" do
    assert_difference('ApartmentAssignment.count') do
      post :create, apartment_assignment: { assignment_date: @apartment_assignment.assignment_date, bedroom: @apartment_assignment.bedroom }
    end

    assert_redirected_to apartment_assignment_path(assigns(:apartment_assignment))
  end

  test "should show apartment_assignment" do
    get :show, id: @apartment_assignment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @apartment_assignment
    assert_response :success
  end

  test "should update apartment_assignment" do
    patch :update, id: @apartment_assignment, apartment_assignment: { assignment_date: @apartment_assignment.assignment_date, bedroom: @apartment_assignment.bedroom }
    assert_redirected_to apartment_assignment_path(assigns(:apartment_assignment))
  end

  test "should destroy apartment_assignment" do
    assert_difference('ApartmentAssignment.count', -1) do
      delete :destroy, id: @apartment_assignment
    end

    assert_redirected_to apartment_assignments_path
  end
end
