class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :small
      t.string :thumbnail
      t.string :flickr_id

      t.timestamps
    end
  end
end
