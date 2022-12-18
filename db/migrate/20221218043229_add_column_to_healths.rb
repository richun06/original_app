class AddColumnToHealths < ActiveRecord::Migration[6.1]
  def change
    add_column :healths, :transfer, :text
  end
end
