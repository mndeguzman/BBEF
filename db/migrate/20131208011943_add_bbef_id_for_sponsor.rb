class AddBbefIdForSponsor < ActiveRecord::Migration
  def change
    add_column :sponsors, :bbef_id, :string
  end
end
