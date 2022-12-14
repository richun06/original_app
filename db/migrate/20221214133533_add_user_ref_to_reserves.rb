class AddUserRefToReserves < ActiveRecord::Migration[6.1]
  def change
    add_reference :reserves, :user, foreign_key: true
  end
end
