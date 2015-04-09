class CreateApartmentAssignments < ActiveRecord::Migration
  def change
    create_table :apartment_assignments do |t|
      t.string :bedroom
      t.date :assignment_date

      t.timestamps null: false
    end
  end
end
