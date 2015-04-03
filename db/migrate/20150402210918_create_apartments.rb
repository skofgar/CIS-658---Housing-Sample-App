class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.string :apartment_number
      t.string :room_number
      t.string :number_of_rooms
      t.integer :max_people
      t.boolean :is_furnished
      t.string :thumbnail

      t.timestamps null: false
    end
  end
end
