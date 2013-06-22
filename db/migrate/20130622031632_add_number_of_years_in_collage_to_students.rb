class AddNumberOfYearsInCollageToStudents < ActiveRecord::Migration
  def change
    add_column :students, :number_of_years_in_collage, :integer
    add_column :students, :course_type, :string
  end
end
