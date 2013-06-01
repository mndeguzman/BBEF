class RenameInstitueToInstitute < ActiveRecord::Migration
  def change
    rename_column :students, :institue, :institute
  end
end
