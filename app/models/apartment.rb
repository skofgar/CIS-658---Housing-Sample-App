class Apartment < ActiveRecord::Base
  has_many :appartment_assignments
  has_many :users, through: :appartment_assignments
end
