class StudentsController < ApplicationController
	
	before_filter :find_student

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

	def show
	end	

	def edit
	end			

	def update
    	@student.update_attributes(params[:student])
	    redirect_to student_path(@student)
	end			

	def associate_sponsor
	    params["sponsor_name"] =~ /(.*) (.*)/
	    first_name = $1
	    sponsor = Sponsor.find_by_first_name first_name
	    @student.sponsor = sponsor 
	    @student.save!
	    redirect_to student_path(@student)
  	end  	

  private 
  def find_student
       @student = Student.find(params[:id]) if params[:id]
  end

end
