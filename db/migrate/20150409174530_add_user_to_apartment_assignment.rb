class AddUserToApartmentAssignment < ActiveRecord::Migration
  def change
    add_reference :apartment_assignments, :user, index: true
    add_foreign_key :apartment_assignments, :users
  end
end
