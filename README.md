# kcpv

## Table of Contents

   * [kcpv](#kcpv)
   * [Table of Contents](#table-of-contents)
   * [Setup](#setup)
   * [Why](#why)
      * [Goals](#goals)
      * [Questions?](#questions)
   * [Usage](#usage)
   * [Files and Data import](#files-and-data-import)
      * [Files](#files)
         * [data/definitions](#datadefinitions)
         * [scripts](#scripts)
      * [Data](#data)
         * [Levy Rates](#levy-rates)
   * [Contact &amp; Copyright](#contact--copyright)

## Setup

Install ruby 2.5.1. Install bundler. Bundle install.

Also install 5.x version of mysql client (i.e. via homebrew).

## Why

Why am I doing this? I want to understand property values, taxes, assessments and zoning.

### Goals

* Understand how property tax changes and how that affects our local tax structure.
* Eventually build some semi-interactive visualization website.

### Questions?

* What is the actual change in tax paid for different properties in the city of Seattle?
* Does zoning type change the actual increases in tax paid? 
* Does year of construction affect amount of tax paid? Is newer construction paying higher actual taxes?
* How many parcels are owned by holding companies? Is their concentration of land wealth?
* Is there skew in assessed land value between parcel types? What happens after sub-division for townhomes?
* How much of our recent skyrocketing property values not actually translated into increased tax revenues?

## Usage

Right now this is all done in rails console. See the [examples](https://github.com/ludwick/kcpv/blob/master/Examples.md).

## Files and Data import

Most of the files and scripts and data are derived from data from the King County Assessor's office's
Data Download page here:

http://info.kingcounty.gov/assessor/DataDownload/default.aspx

They provide ZIP files with one or more CSV files inside as well as MS Word Doc files describing the
data. The data files are not provided here but what I did to download and clean them is described
below. Some files I created by using the data or description files.

### Files

#### `data/definitions`

These are csvs that express the field names and types for the source data files. These are extracted
from the "File Description" Word documents provided. These allowed me to extra an intermediate format
between the Word doc and Rails schema definitions so I could re-generate schema definitions as needed.

#### `scripts`

These are various scripts to load up data from various sources and to get mysql running with data
ingested. They are in various states of functional as I've been working on this. What they do:

* `gen_columns_from_definition.rb` - takes a file from `data/definitions` and emits Rails schema definition.
* `load_levy_rates.rb` - loads levy rate data into the `LevyRate` model
* `load_parcels.rb` - loads parcel data from `EXTR_Parcel.csv` file.
* `load_value_history.rb` - loads value history from `EXTR_ValueHistory_V.csv`
* `mysql.sh*` - starts up a mysql in docker, will run under Mac OSX, unknown for other platforms.

In most cases, these scripts assume that data is in `../property_data`. 

### Data

The data are not totally clean. In some cases, I've found invalid bytes for a UTF-8 file which I
stripped with `iconv`. It seemed to not lose any critical information or corrupt records. Here's what
my property data directory (separate from this repo) currently looks like:

```
./EXTR_LookUp.csv
./EXTR_TaxAcctReceivable_V.csv
./Parcel (1).zip
./EXTR_ValueHistory_V.csv
./EXTR_RealPropApplHist_V.csv
./Extr_ValueHistory_1999.csv
./Extr_ValueHistory_1998.csv
./Extr_ValueHistory_2004.csv
./Extr_ValueHistory_2010.csv
./Extr_ValueHistory_2011.csv
./Extr_ValueHistory_2005.csv
./EXTR_Parcel.csv
./EXTR_Parcel_original.csv
./Value History.zip
./Extr_ValueHistory_2007.csv
./Extr_ValueHistory_2006.csv
./Extr_ValueHistory_2012.csv
./Extr_ValueHistory_2002.csv
./Extr_ValueHistory_2003.csv
./Extr_ValueHistory_2001.csv
./Real Property Sales.zip
./Extr_ValueHistory_2000.csv
./Tax Data (1).zip
./bad_frame.csv
./Extr_ValueHistory_2008.csv
./Extr_ValueHistory_2009.csv
./EXTR_RPSale.csv
./Lookup.zip
./Extr_ValueHistory_1997.csv
./Real Property Appraisal History.zip
```

The sources for the various `.csv` files is hopefully obvious. 

#### Levy Rates 

Assessed rates of property taxes change year over year. I did some work to cleanup and extract rates for
each levy code into csv files. You can find those in the [kc_levy_rates repo](https://github.com/ludwick/kc_levy_rates).

## Contact & Copyright

This was initially created by Rachael Ludwick, 2008, MIT license.

Find me on [twitter](https://twitter.com/raludwick) or give me an email (see profile). Or I guess file
a rull request. :)