ActiveAdmin.register Sponsor do
  
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
	puts notice
    redirect_to :action => :index, :notice => notice
  end

end
