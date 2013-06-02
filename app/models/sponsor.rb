class Sponsor < ActiveRecord::Base
  attr_accessible :current_balance, :date_paid, :first_name, :last_name, :students
  attr_accessible :address, :city, :state, :postcode
  attr_accessible :home_phone, :mobile, :email, :contact_method

  has_many :students

  def full_name
  	"#{first_name} #{last_name}"
  end
end
