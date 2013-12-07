class AddThumbnailToStudent < ActiveRecord::Migration
  def change
    add_column :students, :thumbnail, :string
  end
end
