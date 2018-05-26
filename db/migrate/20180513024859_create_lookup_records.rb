class CreateLookupRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :lookup_records do |t|
      t.integer :type_code
      t.integer :item_code
      t.string :description

      t.timestamps
    end

    add_index :lookup_records, %i[type_code item_code], unique: true
  end
end
