class AddCloumnToCareUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :care_users, :food, :text
    add_column :care_users, :allergy, :text
    add_column :care_users, :sick, :text
    add_column :care_users, :note, :text
  end
end
