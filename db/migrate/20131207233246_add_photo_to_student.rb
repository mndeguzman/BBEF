class AddPhotoToStudent < ActiveRecord::Migration
  def change
    add_column :students, :photo, :string
  end
end
