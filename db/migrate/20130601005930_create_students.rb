class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :grade
      t.string :institue
      t.string :course
      t.date :dob
      t.string :sex
      t.integer :num_year
      t.date :program_start
      t.date :program_end

      t.timestamps
    end
  end
end
