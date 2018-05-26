require 'csv'

def load_file(file, year)
  last_jurisdiction = nil
  CSV.foreach(file, headers: true) do |row|
    jurisdiction = row[0].present? ? row[0].sub(' (cont.)', '') : last_jurisdiction
    args = {
      year: year,
      code: row[1],
      jurisdiction: row[0].present? ? row[0] : last_jurisdiction,
      rate: row[2],
      senior_rate: row[3]
    }
    last_jurisdiction = jurisdiction
    LevyRate.find_or_create_by!(args)
  end
end

files = ARGV
files = Dir.glob(Rails.root.join('..', 'kc_levy_rates', 'csv', 'rates_*.csv')) if files.empty?
files.each do |file|
  year = File.basename(file)[6..9]
  load_file(file, year)
end