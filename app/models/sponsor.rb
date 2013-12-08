class Sponsor < ActiveRecord::Base
  

  attr_accessible :current_balance, :date_paid, :first_name, :last_name, :students , :sponsor_type
  attr_accessible :address, :city, :state, :postcode , :bbef_id ,:country
  attr_accessible :home_phone, :mobile, :email, :contact_method, :organisation

  has_many :students


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :postcode, presence: true


  def full_name
  	"#{first_name} #{last_name}"
  end
end
