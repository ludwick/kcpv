require 'csv'

SYMBOLIC_NAMES = %i[
  major
  minor
  taxyr
  omityr
  apprlandval
  apprimpsval
  apprimpincr
  landval
  impsval
  taxvalreason
  taxstat
  levycode
  changedate
  changedocid
  reason
  splitcode
].freeze

headers = nil
data_file = Rails.root.join('..', 'property_data', 'EXTR_ValueHistory_V.csv')
year_cut_off = 2013
record_max = 2000
record_count = 0
record_set = []
CSV.foreach(data_file, headers: true) do |row|
  if headers.nil?
    headers = row.headers
    if headers.length != SYMBOLIC_NAMES.length
      puts "expected #{SYMBOLIC_NAMES.length} but csv has #{headers.length} columns."
      exit(1)
    end
  end
  next unless row['TaxYr'].to_i >= year_cut_off
  record_set << row.fields.map(&:strip)
  record_count += 1
  if record_count % record_max == 0
    puts "Creating some records!"
    ValueHistory.import!(SYMBOLIC_NAMES, record_set)
    puts "Total count is ##{record_count}."
    record_set = []
  end
rescue StandardError => e
  puts "Failed at record #{record_count+1}!"
  raise
end

if record_set.present?
  ValueHistory.import!(SYMBOLIC_NAMES, record_set)
end