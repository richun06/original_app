class ChangeDataBreakfastToHealth < ActiveRecord::Migration[6.1]
  def change
    change_column :healths, :breakfast, :string
    change_column :healths, :lunch, :string
    change_column :healths, :snack, :string
    change_column :healths, :dinner, :string
    change_column :healths, :before_sleep, :string
    change_column :healths, :morning_medicine, :string
    change_column :healths, :daytime_medicine, :string
    change_column :healths, :snack_medicine, :string
    change_column :healths, :evening_medicine, :string
    change_column :healths, :sleep_medicine, :string
    change_column :healths, :bath_division, :string
  end
end
