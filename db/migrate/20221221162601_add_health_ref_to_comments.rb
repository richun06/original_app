class AddHealthRefToComments < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :health, foreign_key: true
  end
end
