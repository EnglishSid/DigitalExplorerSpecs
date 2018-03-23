# Offering Family Loads


## base solution node
~~~
LOAD csv with headers from "file:///offerings.csv" as Solution
MERGE (s:Solution {
lastModifiedBy:"davidstevens@dxc.com",
objectClass:"Archimate_Product",
description:trim(Solution.Description),
source:"CSVLoader",
creationDate:1520511214558,
searchable:true,
generalValue:trim(Solution.ValueProposition),
elevatorPitch:trim(Solution.elevatorpitch),
lastModificationDate:1520511214558,
createdBy:"CSVLoader",
referenceable:"Yes",
name:trim(Solution.SolutionName),
status:trim(Solution.Status)
})
~~~


## configuration plan
- create an empty node to be referenced in the queries below.
~~~
LOAD csv with headers from "file:///offeringsUnique.csv" as Solution
CREATE (scp:ConfigurationPlan {
name:"BasePlan"
})
WITH scp, Solution
MATCH (s:Solution {name:Solution.SolutionName})
MERGE (s)-[r:OFFLAVOUR]->(scp)
RETURN s, scp
~~~

## check, load, relate

### features (Sub-Offering)

~~~
LOAD csv with headers from "file:///offerings.csv" as Solution
MERGE (f:Feature {
name:trim(Solution.FeatureName)})
with Solution,f
MATCH (s:Solution {name:Solution.SolutionName})
MERGE (s)-[:REALIZEDBY]->(f)
WITH f,s, Solution
MATCH (fc:FeatureCategory)
WHERE fc.name="Offering"
MERGE (f)-[:OFCATEGORY]->(fc)
WITH f,s, Solution,fc
MATCH (s:Solution {name:Solution.SolutionName}),(tg:TechnologyGroup) where tg.name=Solution.TechnologyGroup
MERGE (f)<-[:REALIZEDBY]-(tg)
WITH s,f,fc,tg,Solution
MATCH (s:Solution {name:Solution.SolutionName})--(cp:ConfigurationPlan)
MERGE (cp)-[:REALIZEDBY]->(f)
return s,f,fc,tg,cp
~~~


### people
~~~
LOAD csv with headers from "file:///offerings.csv" as Solution
MERGE (p:Person {
name:trim(Solution.SolutionOwnerName),
email:trim(Solution.SolutionOwneremail)
})
WITH p,Solution
MATCH (s:Solution {name:Solution.SolutionName})
MERGE (p)-[:ASSIGNED {role:'Solution Owner'}]->(s)
return s,p
~~~


## match and relate


### category
~~~
LOAD csv with headers from "file:///offerings.csv" as Solution
MATCH (s:Solution {name:Solution.SolutionName}),(c:Category {name:Solution.Category})
MERGE (c)-[:INFLUENCE]->(s)
return s,c
~~~


### practice

~~~
LOAD csv with headers from "file:///offerings.csv" as Solution
MATCH (s:Solution {name:Solution.SolutionName}),(p:Practice {name:Solution.OfferingFamilies})
MERGE (s)-[:INFLUENCE]->(p)
return s,p
~~~

### sub industry

~~~
LOAD csv with headers from "file:///offerings.csv" as Solution
MATCH (s:Solution {name:Solution.SolutionName}),(i:Industry {name:Solution.Industry})--(si:SubIndustry)
MERGE (si)<-[:INFLUENCE]-(s)
RETURN s,i,si
~~~


### type

~~~
LOAD csv with headers from "file:///offerings.csv" as Solution
MATCH (s:Solution {name:Solution.SolutionName}),(st:META_SolutionType {name:Solution.Type})
MERGE (s)-[:ofType]->(st)
return s,st
~~~


# cleanup 
~~~
LOAD csv with headers from "file:///offerings.csv" as Solution
MATCH (s:Solution {name:Solution.SolutionName})
detach delete s
~~~