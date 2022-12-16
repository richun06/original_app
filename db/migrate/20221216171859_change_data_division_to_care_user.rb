class ChangeDataDivisionToCareUser < ActiveRecord::Migration[6.1]
  def change
    change_column :care_users, :division, :string
  end
end
