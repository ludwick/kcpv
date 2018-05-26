class FixLevyRateColumns < ActiveRecord::Migration[5.2]
  def change
    change_column :levy_rates, :rate, :decimal, precision: 7, scale: 5
    change_column :levy_rates, :senior_rate, :decimal, precision: 7, scale: 5
  end
end
