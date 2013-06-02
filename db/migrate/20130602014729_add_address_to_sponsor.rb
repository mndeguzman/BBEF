class AddAddressToSponsor < ActiveRecord::Migration
  def change
    add_column :sponsors, :address, :string
    add_column :sponsors, :city, :string
    add_column :sponsors, :state, :string
    add_column :sponsors, :postcode, :string
  end
end
