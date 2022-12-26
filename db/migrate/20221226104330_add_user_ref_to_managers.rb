class AddUserRefToManagers < ActiveRecord::Migration[6.1]
  def change
    add_reference :managers, :user, foreign_key: true
  end
end
