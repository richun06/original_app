class RenameKeepTeamIdColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :keep_team_id, :owner_id
  end
end
