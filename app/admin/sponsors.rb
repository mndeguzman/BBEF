ActiveAdmin.register Sponsor do
  menu :priority => 1
  index do
    column "First Name", :first_name
    column "Current Balance", :current_balance
    column "Date Paid", :date_paid
    column "Preferred contact method", :contact_method

    default_actions
  end

  #Filter

  show do
    panel "Sponsors" do
      sponsor.column("First name") { |sponsor| link_to sponsor.first_name, admin_sponsor_path(sponsor) }
    end
  end


end
