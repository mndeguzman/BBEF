class RemoveNumberOfYearsInCollageFromStudents < ActiveRecord::Migration
  def up
    remove_column :students, :number_of_years_in_collage
  end

  def down
    add_column :students, :number_of_years_in_collage, :string
  end
end
