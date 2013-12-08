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
        end
      end
    end
    render 'sponsorlist'
    active_admin_comments
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
