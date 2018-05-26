class CreateValueHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :value_histories do |t|
      t.string :major, null: false
      t.string :minor, null: false
      t.integer :taxyr, null: false
      t.integer :omityr
      t.integer :apprlandval
      t.integer :apprimpsval
      t.integer :apprimpincr
      t.integer :landval
      t.integer :impsval
      t.string :taxvalreason
      t.string :taxstat
      t.integer :levycode
      t.string :changedate
      t.string :changedocid
      t.string :reason
      t.string :splitcode
      t.timestamps
    end

    add_index :value_histories, %i[major minor taxyr]
    add_index :value_histories, %i[major minor]
  end
end
