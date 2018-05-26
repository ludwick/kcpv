class CreateParcels < ActiveRecord::Migration[5.2]
  def change
    create_table :parcels do |t|
      t.string :major
      t.string :minor
      t.string :property_name
      t.string :plat_name
      t.string :plat_lot
      t.string :plat_block
      t.integer :range
      t.integer :township
      t.integer :section
      t.string :quarter_section
      t.string :property_type
      t.string :area
      t.string :subarea
      t.string :specarea
      t.string :specsubarea
      t.string :district_name
      t.string :levy_code
      t.string :current_zoning
      t.integer :hbu_as_if_vacant
      t.integer :hbu_as_improved
      t.integer :present_use
      t.integer :lot_square_footage
      t.integer :water_system
      t.integer :sewer_system
      t.integer :access
      t.integer :topography
      t.integer :street_surface
      t.integer :restrictive_size_shape
      t.integer :inadequate_parking
      t.integer :percent_unusable
      t.integer :view_mt_rainier
      t.integer :view_olympics
      t.integer :view_cascades
      t.integer :view_territorial
      t.integer :view_seattle_skyline
      t.integer :view_puget_sound
      t.integer :view_lake_washington
      t.integer :view_lake_sammamish
      t.integer :view_small_lake_river_creek
      t.integer :view_other_view
      t.integer :waterfront_location
      t.integer :waterfront_footage
      t.integer :waterfront_bank
      t.integer :waterfront_poor_quality
      t.integer :waterfront_restricted_access
      t.string :waterfront_access_rights
      t.string :waterfront_proximity_influence
      t.integer :tideland_shoreland
      t.integer :lot_depth_factor
      t.integer :traffic_noise
      t.integer :airport_noise
      t.string :power_lines
      t.string :other_nuisances
      t.integer :number_building_sites
      t.integer :contamination
      t.string :dnr_lease
      t.string :adjacent_golf_fairway
      t.string :adjacent_greenbelt
      # this field is in the doc describing the parcel data but not in the parcel data
      # t.integer :common_property
      t.integer :historic_site
      t.integer :current_use_designation
      t.string :native_growth_protection_easement
      t.string :easements
      t.string :other_designation
      t.string :deed_restrictions
      t.string :development_rights_purchased
      t.string :coal_mine_hazard
      t.string :critical_drainage
      t.string :erosion_hazard
      t.string :landfill_buffer
      t.string :hundred_year_flood_plain
      t.string :seismic_hazard
      t.string :landslide_hazard
      t.string :steep_slope_hazard
      t.string :stream
      t.string :wetland
      t.string :species_of_concern
      t.string :sensitive_area_tract
      t.string :water_problems
      t.string :transportation_concurrency
      t.string :other_problems
      t.timestamps
    end

    add_index :parcels, %i[major minor], unique: true
    add_index :parcels, %i[current_zoning]
    add_index :parcels, %i[district_name]
    add_index :parcels, %i[lot_square_footage]
  end
end
