class AddApartmentToApartmentAssignment < ActiveRecord::Migration
  def change
    add_reference :apartment_assignments, :apartment, index: true
    add_foreign_key :apartment_assignments, :apartments
  end
end
