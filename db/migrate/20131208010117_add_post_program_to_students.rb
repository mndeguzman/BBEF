class AddPostProgramToStudents < ActiveRecord::Migration
  def change
    add_column :students, :post_program, :string
  end
end
