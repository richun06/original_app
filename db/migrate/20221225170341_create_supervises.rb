class CreateSupervises < ActiveRecord::Migration[6.1]
  def change
    create_table :supervises do |t|
      t.references :health, foreign_key: true
      t.references :manager, foreign_key: true

      t.timestamps
    end
  end
end
