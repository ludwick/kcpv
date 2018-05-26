require 'csv'

# Load lookup descriptions table
lookup_table_data_file = Rails.root.join('..', 'property_data', 'EXTR_LookUp.csv')
CSV.foreach(lookup_table_data_file, headers: true) do |row|
    type = row['LUType'].strip
    item = row['LUItem'].strip
    description = row['LUDescription'].strip
    LookupRecord.create!(type_code: type, item_code: item, description: description)
end