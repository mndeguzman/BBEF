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
        if @student.save
  		  flash[:success] = "Your student has been created"
	      redirect_to students_path
	    else
  		  flash[:error] = "Your student has not been created"
	      render 'new'
	    end
	end		

	def show
		@sponsors = Sponsor.order("last_name").all
	end	

	def edit
	end			

	def update
    	@student.update_attributes(params[:student])
	    redirect_to student_path(@student)
	end			

	def associate_sponsor
		puts "params['sponsor_name'] #{params['sponsor_name']}"
	    sponsor = Sponsor.find(params["sponsor_name"])
	    @student.sponsor = sponsor 
	    @student.save!
	    redirect_to student_path(@student)
  	end  	

  private 
  def find_student
       @student = Student.find(params[:id]) if params[:id]
  end

end
