# WWS Data mapping

|WWS|Digital Explorer|
|---|---|
|Offering family|Practice
|Major Offering|Solution
|Sub Offering|Feature

# Data rules

- ensure name changes to existing data are correctly managed - need to ensure each key data node as an <id> value
- to not delete any solutions or sub offerings from Digital Explorer
- if Major Offering no longer exists - update status of solution to "retired" and mark as "non-searchable"
- if sub offering no longer exists - update feature as "retired" (new property) and ensure this is no longer listed for new solutions
    - existing solution retain relationship unless solution owner removes the relationship

# Frequency

- weekly data sync from WWS master

# API details

overview : https://whatwesell.dxc.com/dxc/about-wws/api/

##  new offering endpoints


A new facet called Page Type was added which allows you to filter by Offering Family, Major Offering, and Sub-Offering.  Below are examples of how this facet can be used.

Get the Major Offerings of an Offering Family
`&fq_offering_family=Application Services&fq_page_type=Major Offering`

Get the Sub-Offerings of a Major Offering
`&fq_offering_major=Applications Development&fq_page_type=Sub-Offering`

Get the Sub-Offerings of an Offering Family
`&fq_offering_family=Application Services&fq_page_type=Sub-Offering`

Get the Sub-Offerings and Major Offerings of an Offering Family
`&fq_offering_family=Application Services&fq_page_type=Major Offering%2cSub-Offering`

Get all Offering Families, Major Offerings, or Sub-Offerings
~~~
&fq_page_type=Offering Family
&fq_page_type=Major Offering
&fq_page_type=Sub-Offering
&fq_page_type=Major Offering%2cSub-Offering (all DXC offerings)
~~~

## Examples

`https://api.whatwesell.dxc.com/2.0/query/?&fq_page_type=Offering Family&fq_page_type=Major Offering&fq_page_type=Sub-Offering&fq_page_type=Major Offering%2cSub-Offering (all DXC offerings)`

