# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_05_14_003452) do

  create_table "levy_rates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "code", null: false
    t.string "year", null: false
    t.string "jurisdiction"
    t.decimal "rate", precision: 7, scale: 5, null: false
    t.decimal "senior_rate", precision: 7, scale: 5, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code", "year"], name: "index_levy_rates_on_code_and_year", unique: true
    t.index ["code"], name: "index_levy_rates_on_code"
    t.index ["jurisdiction"], name: "index_levy_rates_on_jurisdiction"
    t.index ["year"], name: "index_levy_rates_on_year"
  end

  create_table "lookup_mappings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "model"
    t.string "field"
    t.integer "lookup_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["model", "field"], name: "index_lookup_mappings_on_model_and_field", unique: true
  end

  create_table "lookup_records", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "type_code"
    t.integer "item_code"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type_code", "item_code"], name: "index_lookup_records_on_type_code_and_item_code", unique: true
  end

  create_table "parcels", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "major"
    t.string "minor"
    t.string "property_name"
    t.string "plat_name"
    t.string "plat_lot"
    t.string "plat_block"
    t.integer "range"
    t.integer "township"
    t.integer "section"
    t.string "quarter_section"
    t.string "property_type"
    t.string "area"
    t.string "subarea"
    t.string "specarea"
    t.string "specsubarea"
    t.string "district_name"
    t.string "levy_code"
    t.string "current_zoning"
    t.integer "hbu_as_if_vacant"
    t.integer "hbu_as_improved"
    t.integer "present_use"
    t.integer "lot_square_footage"
    t.integer "water_system"
    t.integer "sewer_system"
    t.integer "access"
    t.integer "topography"
    t.integer "street_surface"
    t.integer "restrictive_size_shape"
    t.integer "inadequate_parking"
    t.integer "percent_unusable"
    t.integer "view_mt_rainier"
    t.integer "view_olympics"
    t.integer "view_cascades"
    t.integer "view_territorial"
    t.integer "view_seattle_skyline"
    t.integer "view_puget_sound"
    t.integer "view_lake_washington"
    t.integer "view_lake_sammamish"
    t.integer "view_small_lake_river_creek"
    t.integer "view_other_view"
    t.integer "waterfront_location"
    t.integer "waterfront_footage"
    t.integer "waterfront_bank"
    t.integer "waterfront_poor_quality"
    t.integer "waterfront_restricted_access"
    t.string "waterfront_access_rights"
    t.string "waterfront_proximity_influence"
    t.integer "tideland_shoreland"
    t.integer "lot_depth_factor"
    t.integer "traffic_noise"
    t.integer "airport_noise"
    t.string "power_lines"
    t.string "other_nuisances"
    t.integer "number_building_sites"
    t.integer "contamination"
    t.string "dnr_lease"
    t.string "adjacent_golf_fairway"
    t.string "adjacent_greenbelt"
    t.integer "historic_site"
    t.integer "current_use_designation"
    t.string "native_growth_protection_easement"
    t.string "easements"
    t.string "other_designation"
    t.string "deed_restrictions"
    t.string "development_rights_purchased"
    t.string "coal_mine_hazard"
    t.string "critical_drainage"
    t.string "erosion_hazard"
    t.string "landfill_buffer"
    t.string "hundred_year_flood_plain"
    t.string "seismic_hazard"
    t.string "landslide_hazard"
    t.string "steep_slope_hazard"
    t.string "stream"
    t.string "wetland"
    t.string "species_of_concern"
    t.string "sensitive_area_tract"
    t.string "water_problems"
    t.string "transportation_concurrency"
    t.string "other_problems"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["current_zoning"], name: "index_parcels_on_current_zoning"
    t.index ["district_name"], name: "index_parcels_on_district_name"
    t.index ["lot_square_footage"], name: "index_parcels_on_lot_square_footage"
    t.index ["major", "minor"], name: "index_parcels_on_major_and_minor", unique: true
  end

  create_table "value_histories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "major", null: false
    t.string "minor", null: false
    t.integer "taxyr", null: false
    t.integer "omityr"
    t.integer "apprlandval"
    t.integer "apprimpsval"
    t.integer "apprimpincr"
    t.integer "landval"
    t.integer "impsval"
    t.string "taxvalreason"
    t.string "taxstat"
    t.integer "levycode"
    t.string "changedate"
    t.string "changedocid"
    t.string "reason"
    t.string "splitcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["major", "minor", "taxyr"], name: "index_value_histories_on_major_and_minor_and_taxyr"
    t.index ["major", "minor"], name: "index_value_histories_on_major_and_minor"
  end

end
