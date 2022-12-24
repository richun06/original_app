class ChangeColumnToComment < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :comments, :healths
    remove_index :comments, column: :health_id
    remove_reference :comments, :health
  end
end
