class CreateReserves < ActiveRecord::Migration[6.1]
  def change
    create_table :reserves do |t|

      t.string :title
      t.text :content
      t.datetime :start_time

      t.timestamps
    end
  end
end
