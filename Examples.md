## Examples!!

Right now I'm doing this all in `rails console`.

### Lookup a particular parcel

```
Parcel.where(major: '243670', minor: '0145')
```

### Find all residential parcels in an "area"

The assessor's office defines various "areas" with numeric codes. These are roughly neighborhoods.
This is convenient to get a chunk of related parcels in the same region.

```
Parcel.where(area: "45", property_type: 'R')
```

### Find all SF zoned parcels (Seattle zoning designations)!

```
Parcel.where(current_zoning: ['SF 5000', 'SF 7200', 'SF 9600'])
```

### Get property tax for a year

```
p = Parcel.where(...).first
p.tax(2017)
p.tax(2017, :senior)
```

### Get a list of assessed values for a set of parcels

```
parcels = Parcel.where(...)
values = parcels.map { |p| p.assesssed_value(2017) }
totals = values.map(&:total_appraised)
```
