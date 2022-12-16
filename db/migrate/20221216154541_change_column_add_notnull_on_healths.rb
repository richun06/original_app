class ChangeColumnAddNotnullOnHealths < ActiveRecord::Migration[6.1]
  def change
    change_column_null :healths, :responsibility, false
  end
end
