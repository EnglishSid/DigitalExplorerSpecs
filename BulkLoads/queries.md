# Import Queries

## Assumptions
- type, status, Categories, Industries, Offerings and technology groups existing in metadata - no new data
- Methods and Partner Capabilties will be compared before import - adds new


#### notes
- copy down the solution node rows

## Create the new nodes

### Solution
~~~
LOAD csv with headers from "file:///SolutionExample.csv" as Solution
MERGE (s:Solution {
name:trim(Solution.SolutionName),
elevatorPitch:trim(Solution.elevatorpitch),
description:trim(Solution.Description),
generalValue:trim(Solution.ValueProposition),
searchable:"Yes",
source:"CSVLoader",
status:trim(Solution.Status),
objectClass:"Archimate_Product",
createdBy:"CSVLoader"
})
~~~

---

### Motivations
#### Find potential industry trends
#### Create Relationships only

~~~
LOAD csv with headers from "file:///SolutionExample.csv" as Solution
MATCH (s:Solution {name:Solution.SolutionName}),(tt:TechnologyTrend) where lower(tt.name)=lower(Solution.MotivationName) 
MERGE (s)<-[r:INFLUENCE]-(tt)
RETURN s, tt
~~~

#### Find potential technology trends
#### Create Relationships only
~~~
LOAD csv with headers from "file:///SolutionExample.csv" as Solution
MATCH (s:Solution {name:Solution.SolutionName}),(bt:BusinessTrend) where lower(bt.name)=lower(Solution.MotivationName) 
MERGE (s)<-[r:INFLUENCE]-(bt)
RETURN s, bt
~~~

#### add anything which doesn't match
q: how to exclude matched trends?
TODO

---

### Offerings
#### Assumes they are preloaded
~~~
LOAD csv with headers from "file:///SolutionExample.csv" as Solution
MATCH (s:Solution {name:Solution.SolutionName}),(f:Feature {name:Solution.DXCOFFERINGS})
MERGE (s)-[r:REALIZEDBY]->(f)
return s,f
~~~

### Methods
#### Match & Load - just to be sure
~~~
MERGE (f:Feature {name:Solution.METHODS})
WITH f
MATCH (ft:FeatureCategory)  where ft.name="Method"
WITH f,ft
MERGE (f)-[:OFCATEGORY]->(ft)
RETURN f,ft
~~~
#### Relate 
~~~
LOAD csv with headers from "file:///SolutionExample.csv" as Solution
MATCH (s:Solution {name:Solution.SolutionName}),(f:Feature {name:Solution.METHODS})
MERGE (s)-[r:REALIZEDBY]->(f)
return s,f
~~~

### Features
#### Create
~~~
LOAD csv with headers from "file:///SolutionExample.csv" as Solution
MERGE (f:Feature {
    name:trim(Solution.FeatureName),
    description:trim(Solution.FeatureDescription)
})
RETURN f
~~~

#### Map to type
~~~
LOAD csv with headers from "file:///SolutionExample.csv" as Solution
MATCH (f:Feature {name:Solution.FeatureName}),(ft:FeatureCategory {name:Solution.FeatureType})
MERGE (f)-[r:OFCATEGORY]->(ft)
RETURN f,ft
~~~

#### Map to technology group
~~~
LOAD csv with headers from "file:///SolutionExample.csv" as Solution
MATCH (f:Feature {name:Solution.FeatureName}),(tg:TechnologyGroup {name:Solution.TechnologyGroup})
MERGE (f)<-[r:REALIZEDBY]-(tg)
RETURN f,tg
~~~


#### Map to solution
~~~
LOAD csv with headers from "file:///SolutionExample.csv" as Solution
MATCH (s:Solution {name:Solution.SolutionName}),(f:Feature {name:Solution.FeatureName})
MERGE (f)<-[r:REALIZEDBY]-(s)
RETURN f,s
~~~

### Configuration plan
Solutions must have atleast one
#### Create & Map
~~~
CREATE (cp:ConfigurationPlan {name:"Base Plan"})
WITH cp
LOAD csv with headers from "file:///SolutionExample.csv" as Solution
MATCH (s:Solution {name:Solution.SolutionName})--[f:Feature]
MERGE (cp)<-[r:OFFLAVOUR]-(s)
MERGE (cp)-[r2:REALIZEDBY]->(f)
RETURN cp,s,f
~~~

---

### People
#### Load People Nodes
~~~~
LOAD csv with headers from "file:///SolutionExample.csv" as Solution
MERGE (p:Person {
name:trim(Solution.SolutionOwnerName),
email:trim(Solution.SolutionOwneremail)
})
return p
~~~~

#### Map Person to solution
~~~~
LOAD csv with headers from "file:///SolutionExample.csv" as Solution
MATCH (s:Solution {name:Solution.SolutionName}),(p:Person {email:Solution.SolutionOwneremail})
MERGE (s)<-[r:ASSIGNED {role:"Solution Owner"}]-(p)
return s,p
~~~~

### Industry
~~~~
LOAD csv with headers from "file:///SolutionExample.csv" as Solution
MATCH (s:Solution {name:Solution.SolutionName}),(i:Industry {name:Solution.Industry})
MERGE (s)<-[r:INFLUENCE]-(i)
RETURN s,i
~~~~

### Category
~~~~
LOAD csv with headers from "file:///SolutionExample.csv" as Solution
MATCH (s:Solution {name:Solution.SolutionName}),(c:Category {name:Solution.Category})
MERGE (s)<-[r:INFLUENCE]-(c)
RETURN s,c
~~~~

### Offering Family
~~~~
LOAD csv with headers from "file:///SolutionExample.csv" as Solution
MATCH (s:Solution {name:Solution.SolutionName}),(p:Pratice {name:Solution.OfferingFamilies})
MERGE (s)<-[r:INFLUENCE]-(p)
RETURN s,p
~~~~


### Tags 
**Add to CSV File**

## Other Relationships



### clean-up

Remove the `-` nodes
Person name
Feature name