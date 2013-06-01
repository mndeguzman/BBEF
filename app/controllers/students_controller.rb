class StudentsController < ApplicationController
	def index
		@students = Student.order("last_name").all
	end

	def new
		@student = Student.new
	end	

	def create
	    @student = Student.new(params[:student])
	    @student.save
	    redirect_to students_path
	end		
end
