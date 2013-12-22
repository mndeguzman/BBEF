class RemoveThumbnailFromStudent < ActiveRecord::Migration
  def up
    remove_column :students, :thumbnail
  end

  def down
    add_column :students, :thumbnail, :string
  end
end
