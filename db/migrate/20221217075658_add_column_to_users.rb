class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :keep_team_id, :integer
  end
end
