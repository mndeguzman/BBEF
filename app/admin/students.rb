ActiveAdmin.register Student do
  menu :priority => 2
  index do
    column "First Name", :first_name
    column "Last Name", :last_name
    column "Grade", :grade
    column "School/College", :institute

    default_actions
  end

  #Filters
  filter :sponsor_id, :as => :select, :collection => proc {(Sponsor.all).map{|p| [p.full_name, p.id]}}
  filter :institute, :as => :select, :collection => proc {(Student.all).map{|p| [p.institute]}}, :label => 'School'

  show do |student|
    render partial: 'student_photo', locals: {student: student, image_type: :small}
    div :class => 'right-section' do
      h2 student.full_name
      div do
        attributes_table do
          row :dob
          row 'Gender' do
            student.sex
          end
          row :grade
          row 'School/College' do
            student.institute
          end
          row 'Course' do
            student.course_type
          end
          row 'Created on' do
            student.created_at
          end
        end
      end
    end
    render 'sponsorlist'
    active_admin_comments
  end

  form do |f|
    f.inputs "Details" do
      f.input "sponsor_id", :label => "Sponsor", :as => :select, :collection => Sponsor.all.map {|s| [s.full_name, s.id] }
      f.input "first_name", :label => "First name"
      f.input "last_name", :label => "Last name"
      f.input "dob", :as => :date_select, :start_year => Time.now.year - 25, :end_year => Time.now.year, :label => "Date of Birth"
      f.input "grade", :as => :select, :collection => ["Kinder", "Grade 1", "Grade 2", "Grade 3", "Grade 4", "Grade 5", "Grade 6", "1st year Highschool", "2nd year Highschool", "3rd year Highschool", "4th year Highschool", "College 1", "College 2", "College 3", "College 4", "College 5"], :label => "Grade"
      f.input "institute", :label => "School/College"
      f.input "course_type", :label => 'Course'
      f.input "sex", :as => :radio, :collection => ["Male", "Female"], :label => "Gender"
      f.input "program_end", :label => "Program end date"
      f.input "post_program", :label => "Post program career"
    end
    f.actions
  end

  member_action :update_photo, method: :post do
    student = Student.includes(:photo).find(params[:id])
    student.photo.delete if student.photo
    student.photo = Photo.new( params[:photo] )
    student.save

    redirect_to(request.env["HTTP_REFERER"])
  end

  member_action :delete_photo, method: :delete do
    student = Student.includes(:photo).find(params[:id])
    student.photo.try(:delete)

    redirect_to(request.env["HTTP_REFERER"])
  end


  action_item :only => :index do
    link_to 'Upload CSV', :action => 'upload_students'
  end

  collection_action :upload_students do
    render "admin/students/upload_students"
  end

  collection_action :import_students, :method => :post do
    result = StudentImporter.process_csv(params[:csv].tempfile)
    notice = "You have successfully uploaded #{result[:added]} students"
  if result[:errors] > 0 || result[:added] < 1
    result[:error_messages] = result[:error_messages].unshift "no results processed" if result[:added] < 1
    result[:error_messages] = result[:error_messages].unshift "#{result[:errors]} stock details could not be uploaded"
    notice = result[:error_messages].join("<br/>").html_safe
  end

    redirect_to :action => :index, :notice => notice

  end

end
