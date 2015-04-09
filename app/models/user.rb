class User < ActiveRecord::Base
  validates :fname, :lname, :email, :presence => true
  validates :email, :uniqueness => true
  validates_format_of :email, :with => /.+@.+\..+/i
  #validate_on_create :apartments_within_bounds

  has_many :appartment_assignments
  has_many :apartments, through: :appartment_assignments

  private

  def apartments_within_bounds
    return if apartments.blank?
    errors.add("You can only book up to two appartments for the next semester") if apartments.size > 2
  end
end
