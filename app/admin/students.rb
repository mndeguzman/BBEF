ActiveAdmin.register Student do
  menu :priority => 2
  index do
    column "First Name", :first_name
    column "Date of Birth", :dob
    column "Grade", :grade
    column "Institution", :institute

    default_actions
  end

  #Filters
  filter :sponsor_id, :collection => proc {(Sponsor.all).map{|p| [p.full_name, p.id]}}
  filter :institute, :as => :select, :collection => proc {(Student.all).map{|p| [p.institute]}}, :label => 'School'

  show do |student|
    render partial: 'student_photo', locals: {student: student}
    div :class => 'right-section' do
      h2 student.full_name
      div do
        attributes_table do
          row :dob
          row :sex
          row :grade
          row :institute
          row :course_type
          row :created_at
        end
      end
    end
    render 'sponsorlist'
    active_admin_comments
  end

  form do |f|
    f.inputs "Details" do
      f.input "sponsor_id", :label => "Sponsor"
      f.input "first_name", :label => "First name"
      f.input "last_name", :label => "Last name"
      f.input "dob", :as => :date_select, :start_year => Time.now.year - 25, :end_year => Time.now.year, :label => "Date of Birth"
      f.input "grade", :as => :select, :collection => ["Kinder", "Grade 1", "Grade 2", "Grade 3", "Grade 4", "Grade 5", "Grade 6", "1st year Highschool", "2nd year Highschool", "3rd year Highschool", "4th year Highschool", "College 1", "College 2", "College 3", "College 4", "College 5"], :label => "Grade"
      f.input "institute", :label => "School/College"
      f.input "course_type", :label => 'Course'
      f.input "sex", :as => :radio, :collection => ["Male", "Female"], :label => "Gender"
      f.input "program_end", :label => "Program end date"
      f.input "post_program", :label => "Post program career"
      f.input "thumbnail"
    end
  end

  member_action :update_photo, :method => :post do
    puts "params = #{params}"
    student = Student.find(params[:id])
    photo = params[:photo]

    saved_image = ImageService.singleton.upload(photo)
    puts "saved_image = #{saved_image}"
    student.thumbnail = saved_image[:thumbnail]
    student.photo = saved_image[:small]
    student.save

    redirect_to admin_student_path(student)
  end
end
