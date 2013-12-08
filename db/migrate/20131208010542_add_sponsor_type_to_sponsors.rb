class AddSponsorTypeToSponsors < ActiveRecord::Migration
  def change
    add_column :sponsors, :sponsor_type, :string
  end
end
