class RemoveIndexComments < ActiveRecord::Migration[6.1]
  def change
    remove_index :comments, column: :health_id
    remove_column :comments, :health_id, :bigint
  end
end
