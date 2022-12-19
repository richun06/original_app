class AddColumnToCareUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :food, :text
    add_column :users, :allergy, :text
    add_column :users, :sick, :text
    add_column :users, :note, :text
  end
end
