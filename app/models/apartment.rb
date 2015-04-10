class Apartment < ActiveRecord::Base
  has_many :apartment_assignments
  has_many :users, through: :apartment_assignments
end
