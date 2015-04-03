class AddColumnNameToApartment < ActiveRecord::Migration
  def change
    add_column :apartments, :thumbnail, :string
  end
end
