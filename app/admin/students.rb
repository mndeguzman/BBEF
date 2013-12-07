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
    img image_tag('http://s3.amazonaws.com/37assets/svn/765-default-avatar.png',size: '200x200', class: 'left-section')
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
    active_admin_comments
  end


end
