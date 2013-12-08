class AddCountryToSponsors < ActiveRecord::Migration
  def change
    add_column :sponsors, :country, :string
  end
end
