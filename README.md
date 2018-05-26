# README

## Setup

Install ruby 2.5.1. Install bundler. Bundle install.

Also install 5.x version of mysql client (i.e. via homebrew).

## Why

Why am I doing this? I want to understand property values, taxes, assessments and zoning.

### Questions?

* What is the actual change in tax paid for different properties in the city of Seattle?
* Does zoning type change the actual increases in tax paid? 
* Does year of construction affect amount of tax paid? Is newer construction paying higher actual taxes?
* How many parcels are owned by holding companies? Is their concentration of land wealth?
* Is there skew in assessed land value between parcel types? What happens after sub-division for townhomes?
*

## Files

### data

* definitions - these are csvs that express the field names and types for the source data files

### scripts

These are various scripts to load up data from various sources and to get mysql running.