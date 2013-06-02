class AddContactsToSponsor < ActiveRecord::Migration
  def change
    add_column :sponsors, :home_phone, :string
    add_column :sponsors, :mobile, :string
    add_column :sponsors, :email, :string
    add_column :sponsors, :contact_method, :string
  end
end
