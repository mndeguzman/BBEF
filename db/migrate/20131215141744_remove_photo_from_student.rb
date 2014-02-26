class RemovePhotoFromStudent < ActiveRecord::Migration
  def up
    remove_column :students, :photo
  end

  def down
    add_column :students, :photo, :string
  end
end
