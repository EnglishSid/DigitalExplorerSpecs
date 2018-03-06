# Trend description enrichment

Many trends still have their description value the same as the trend name.   

## Proposal
Use the WikiData to prepare a list of potential values to overwrite the current name value.   The list should be validated before importing.


## WikiData & it's API

"Wikidata is a free and open knowledge base that can be read and edited by both humans and machines. Wikidata acts as central storage for the structured data of its Wikimedia sister projects including Wikipedia, Wikivoyage, Wikisource, and others"

### Querying the API

~~~
https://www.wikidata.org/w/api.php?action=wbsearchentities&search=3d%20printing&language=en&format=json
~~~

