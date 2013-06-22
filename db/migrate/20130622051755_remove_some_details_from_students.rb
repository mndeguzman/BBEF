class RemoveSomeDetailsFromStudents < ActiveRecord::Migration
  def up
    remove_column :students, :num_years
    remove_column :students, :course
  end

  def down
    add_column :students, :course, :string
    add_column :students, :num_years, :integer
  end
end
