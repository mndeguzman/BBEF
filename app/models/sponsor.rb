class Sponsor < ActiveRecord::Base
  attr_accessible :current_balance, :date_paid, :first_name, :last_name,:students
  has_many :students
end
