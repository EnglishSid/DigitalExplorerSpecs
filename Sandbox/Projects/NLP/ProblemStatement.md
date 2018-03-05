# Problem Statement

Orginal data was extracted and loaded into the database from a set of powerpoint presentations.   This dataset as well as being disconnected, also included gaps within the target datamodel.

## Disconnected data
- Duplicate trend names across files (name=name) : RESOLVED
- Near matches across files

## Gaps
The powerpoint files didn't allow people to provide a detailed industry use case description.  As a result the initial dataload took the name as the description.

### Data model within Digital Explorer
![BModel](https://github.dxc.com/ArchitectureOffice/DigitalExplorer/blob/master/images/BusinessTrendModel.png

Note : The trend module does not map the name or description against WordNet

## Areas to address
- Find potential matches between similar names
- Enrichment of description, find standard defintions for trends where _description = name_

### Activities

- Near matches (Marcin G)
- Enrichment (Dave S)





