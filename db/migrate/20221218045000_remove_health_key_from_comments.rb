class RemoveHealthKeyFromComments < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :comments, :healths
  end
end
