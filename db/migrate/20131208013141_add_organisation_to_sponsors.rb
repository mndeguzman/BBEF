class AddOrganisationToSponsors < ActiveRecord::Migration
  def change
    add_column :sponsors, :organisation, :string
  end
end
