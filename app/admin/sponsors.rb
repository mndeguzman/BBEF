ActiveAdmin.register Sponsor do
  menu :priority => 1
  index do
    column "First Name", :first_name
    column "Current Balance", :current_balance
    column "Date Paid", :date_paid
    column "Preferred contact method", :contact_method

    default_actions
  end


end
