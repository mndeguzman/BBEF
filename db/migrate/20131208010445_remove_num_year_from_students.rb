class RemoveNumYearFromStudents < ActiveRecord::Migration
  def up
    remove_column :students, :num_year
  end

  def down
    add_column :students, :num_year, :string
  end
end
