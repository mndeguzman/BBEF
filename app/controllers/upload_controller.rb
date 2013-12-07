require 'csv'
class UploadController < ApplicationController

	def view_upload

	end

	def upload
		begin
			puts "hello"
			result = process_csv(params[:csv].tempfile, params[:type])
			raise error if result[:added] < 1
			if result[:errors] > 0
				result[:error_messages] = result[:error_messages].unshift "#{result[:errors]} stock details could not be uploaded"
				flash[:error] = result[:error_messages].join("<br/>").html_safe
			end
		    puts "hello 3"
			redirect_to '/upload/view_upload', notice: "You have successfully uploaded #{result[:added]} stock details for the following year #{params[:year]}"
		rescue
		    puts "hello 2"
			flash[:error] = "The file could not be uploaded"
			redirect_to '/upload/view_upload'
		end
	end



  

end	