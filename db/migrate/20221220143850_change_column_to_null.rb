class ChangeColumnToNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :healths, :responsibility, true
  end
end
