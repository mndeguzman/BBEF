class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :first_name
      t.string :last_name
      t.decimal :current_balance
      t.date :date_paid

      t.timestamps
    end
  end
end
