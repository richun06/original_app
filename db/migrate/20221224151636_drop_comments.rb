class DropComments < ActiveRecord::Migration[6.1]
  def change
    drop_table :comments do |t|
      t.text "content"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      end
  end
end
