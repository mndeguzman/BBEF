class StudentsController < ApplicationController
	def index
		@students = Student.order("last_name").all
	end
end
