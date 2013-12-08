class AddMiddleNameToStudent < ActiveRecord::Migration
  def change
    add_column :students, :middle_name, :string
  end
end
