class CreateLevyRates < ActiveRecord::Migration[5.2]
  def change
    create_table :levy_rates do |t|
      t.string :code, null: false
      t.string :year, null: false 
      t.string :jurisdiction
      t.decimal :rate, null: false
      t.decimal :senior_rate, null: false

      t.timestamps
    end

    add_index :levy_rates, %i[code year], unique: true
    add_index :levy_rates, :code, unique: false
    add_index :levy_rates, :year, unique: false
    add_index :levy_rates, :jurisdiction, unique: false
  end
end
