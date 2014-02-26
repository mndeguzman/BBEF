class AddPhotoFkToStudent < ActiveRecord::Migration
  def change
    add_column :students, :photo_id, :integer
  end
end
