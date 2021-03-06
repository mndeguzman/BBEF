ActiveAdmin.register Sponsor do
  menu :priority => 1
  index do
    column "First Name", :first_name
    column "Last Name", :last_name
    column "Current Balance", :current_balance
    column "Date Paid", :date_paid
    column "Preferred contact", :contact_method

    default_actions
  end


  #Filter

  filter :last_name, :as => :string
  filter :organisation, :as => :string
  filter :current_balance, :as => :numeric
  filter :date_paid, :as => :date_range
  filter :sponsor_type, :as => :check_boxes, :collection => ["Sponsor", "Interested", "Ready to Sponsor"]


    # Show
    show do |sponsor|
      attributes_table do
        row :first_name
        row :last_name
        row :organisation
        row 'Type' do
          sponsor.sponsor_type
        end
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

    form do |f|
      f.inputs "Details" do
        f.input :first_name
        f.input :last_name
        f.input :organisation
        f.input :sponsor_type, :as => :select, :collection => ["Sponsor", "Interested", "Ready to Sponsor"], :label => "Type"
        f.input :current_balance
        f.input :date_paid
        f.input :address
        f.input :city
        f.input :state
        f.input :country
        f.input :postcode
        f.input :home_phone
        f.input :mobile
        f.input :email, :as => :email
        f.input :contact_method, :as => :radio, :collection => ["Email","Home", "Mobile" ]
      end
      f.actions
    end


 action_item :only => :index do
    link_to 'Upload CSV', :action => 'upload_sponsors'
  end

  collection_action :upload_sponsors do
    render "admin/sponsors/upload_sponsors"
  end

  collection_action :import_sponsors, :method => :post do
    result = SponsorImporter.process_csv(params[:csv].tempfile)
    notice = "You have successfully uploaded #{result[:added]} sponsors"
	if result[:errors] > 0 || result[:added] < 1
		result[:error_messages] = result[:error_messages].unshift "no results processed" if result[:added] < 1
		result[:error_messages] = result[:error_messages].unshift "#{result[:errors]} sponser could not be uploaded"
		notice = result[:error_messages].join("<br/>").html_safe
	end

    redirect_to({:action => :index},:notice => notice)

  end


end
