class RemoveColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :food
    remove_column :users, :allergy
    remove_column :users, :sick
    remove_column :users, :note
  end
end
