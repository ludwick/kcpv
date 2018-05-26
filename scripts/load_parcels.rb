require 'csv'

SYMBOLIC_NAMES = %i[
  major
  minor
  property_name
  plat_name
  plat_lot
  plat_block
  range
  township
  section
  quarter_section
  property_type
  area
  subarea
  specarea
  specsubarea
  district_name
  levy_code
  current_zoning
  hbu_as_if_vacant
  hbu_as_improved
  present_use
  lot_square_footage
  water_system
  sewer_system
  access
  topography
  street_surface
  restrictive_size_shape
  inadequate_parking
  percent_unusable
  view_mt_rainier
  view_olympics
  view_cascades
  view_territorial
  view_seattle_skyline
  view_puget_sound
  view_lake_washington
  view_lake_sammamish
  view_small_lake_river_creek
  view_other_view
  waterfront_location
  waterfront_footage
  waterfront_bank
  waterfront_poor_quality
  waterfront_restricted_access
  waterfront_access_rights
  waterfront_proximity_influence
  tideland_shoreland
  lot_depth_factor
  traffic_noise
  airport_noise
  power_lines
  other_nuisances
  number_building_sites
  contamination
  dnr_lease
  adjacent_golf_fairway
  adjacent_greenbelt
  historic_site
  current_use_designation
  native_growth_protection_easement
  easements
  other_designation
  deed_restrictions
  development_rights_purchased
  coal_mine_hazard
  critical_drainage
  erosion_hazard
  landfill_buffer
  hundred_year_flood_plain
  seismic_hazard
  landslide_hazard
  steep_slope_hazard
  stream
  wetland
  species_of_concern
  sensitive_area_tract
  water_problems
  transportation_concurrency
  other_problems
].freeze

mapping_hash = nil
parcel_data_file = Rails.root.join('..', 'property_data', 'EXTR_Parcel.csv')
record_count = 0
CSV.foreach(parcel_data_file, headers: true) do |row|
  if mapping_hash.nil?
    headers = row.headers
    if headers.length != SYMBOLIC_NAMES.length
      puts "expected #{SYMBOLIC_NAMES.length} but csv has #{headers.length} columns."
      exit(1)
    end
    mapping_hash = headers.zip(SYMBOLIC_NAMES).to_h
  end
  args = mapping_hash.map { |k, v| [v, row[k].strip] }.to_h
  Parcel.find_or_create_by!(args)
  record_count += 1
  if record_count % 100 == 0
    puts "Created record ##{record_count}"
  end
rescue StandardError => e
  puts "Failed at record #{record_count+1}!"
  raise
end