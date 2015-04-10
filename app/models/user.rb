class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, :presence => true
  validates :email, :uniqueness => true
  validates_format_of :email, :with => /.+@.+\..+/i
  #validate_on_create :apartments_within_bounds

  has_many :apartment_assignments
  has_many :apartments, through: :apartment_assignments

  private

  def apartments_within_bounds
    return if apartments.blank?
    errors.add("You can only book up to two appartments for the next semester") if apartments.size > 2
  end
end
