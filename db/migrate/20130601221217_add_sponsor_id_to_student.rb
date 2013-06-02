class AddSponsorIdToStudent < ActiveRecord::Migration
  def change
    add_column :students, :sponsor_id, :integer
  end
end
