# Takes a file in data/definitions which is extracted CSV
# of a property data file doc table and emits migration
# column definitions.

require 'csv'

table_name = ARGV[0]
definition_file = Rails.root.join('data', 'definitions', "#{table_name}.csv")
CSV.foreach(definition_file, headers: true) do |row|
  # Field Name,Format,Length,Look Up
  field_name = row['Field Name'].strip.parameterize.underscore
  type_name = case row['Format']
              when 'character'
                'string'
              when 'number'
                'integer'
              else
                'string'
              end
  puts "t.#{type_name} :#{field_name}"
end