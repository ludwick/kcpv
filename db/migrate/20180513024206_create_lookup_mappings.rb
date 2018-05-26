class CreateLookupMappings < ActiveRecord::Migration[5.2]
  def change
    create_table :lookup_mappings do |t|
      t.string :model
      t.string :field
      t.integer :lookup_type

      t.timestamps
    end

    add_index :lookup_mappings, %i[model field], unique: true
  end
end
