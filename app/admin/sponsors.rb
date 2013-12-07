ActiveAdmin.register Sponsor do
  menu :priority => 1
  index do
    column "First Name", :first_name
    column "Last Name", :last_name
    column "Current Balance", :current_balance
    column "Date Paid", :date_paid
    column "Preferred contact method", :contact_method

    default_actions
  end


  #Filter

  filter :last_name, :as => :string
  filter :current_balance, :as => :numeric
  filter :date_paid, :as => :date_range


    # Show
    show do |sponsor|
      attributes_table do
        row :first_name
        row :last_name
        row :current_balance
        row :date_paid
        row :address
        row :city
        row :state
        row :postcode
        row :home_phone
        row :mobile
        row :email
        row :contact_method
      end
      panel "Students" do
        render "studentlist"
      end
      active_admin_comments
    end





 action_item :only => :index do
    link_to 'Upload CSV', :action => 'upload_sponsors'
  end

  collection_action :upload_sponsors do
    render "admin/sponsors/upload_sponsors"
  end

  collection_action :import_sponsor, :method => :post do
    result = SponsorImporter.process_csv(params[:csv].tempfile)
    notice = "You have successfully uploaded #{result[:added]} sponsors"
	if result[:errors] > 0 || result[:added] < 1
		result[:error_messages] = result[:error_messages].unshift "no results processed" if result[:added] < 1
		result[:error_messages] = result[:error_messages].unshift "#{result[:errors]} stock details could not be uploaded"
		notice = result[:error_messages].join("<br/>").html_safe
	end

    redirect_to :action => :index, :notice => notice

  end


end
