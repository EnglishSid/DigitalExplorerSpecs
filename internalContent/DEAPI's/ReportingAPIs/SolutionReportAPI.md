
## Solution Model

Consists of 4 API's

## Solution and Type
`/api/reporting/solution/getAllSolution`

## Solution and Tags

`/api/reporting/solution/getAllSolutionTags`

## Solution and Industries

`/api/reporting/solution/getAllSolutionIndustries`

## Solution and Trends
`/api/reporting/solution/getAllSolutionTrends`


### Parameters
- None

### Pre-requisites 
- None

### Data Model

![image](images/SolutionReport.png)<br>

### Neo4j Queries


---

#### Solutions (API 1)

~~~
//ALL SOLUTIONS
//*****************
MATCH (s:Solution {isPrivate:false} )-[:ofType]->(sst:SolutionSubType)<-[:SubType]-(st:SolutionType)
RETURN DISTINCT 
    id(s)as ID, 
    s.name as SolutionName, 
    s.status as SolutionStatus,
    s.elevatorPitch as SolutionPitch,
    sst.name as SolutionSubType, 
    st.name as SolutionType
~~~

### Solution Tags (API 2)
~~~
//SOLUTION TAGS
MATCH (s:Solution {isPrivate:false} )-[:DESCRIBEDBY]->(t:Tag)
RETURN DISTINCT
    id(s)as ID, 
    s.name as SolutionName, 
    s.status as SolutionStatus,
    s.elevatorPitch as SolutionPitch, 
    COLLECT (t.name) as Tags
~~~


### Solution Industry Information (API 3)
~~~
//SOLUTION INDUSTRY
MATCH (s:Solution {isPrivate:false} )<-[:INFLUENCE]-(si:SubIndustry)-[:VALUEOF]->(i:Industry)
RETURN DISTINCT
    id(s)as ID,
    s.name as SolutionName,
    s.status as SolutionStatus,
    s.elevatorPitch as SolutionPitch,
    COLLECT (si.name) as SubIndustryName,
    COLLECT (i.name) as IndustryName
~~~

#### Solution Trends (API 4)
~~~
//SOLUTION TRENDS
//*****************
//BUSINESS TRENDS
MATCH (s:Solution {isPrivate:false} )<-[:INFLUENCE]-(bt:BusinessTrend)
RETURN DISTINCT 
    id(s)as ID,
    s.name as SolutionName, 
    COLLECT (bt.name) as TrendName
UNION
//TECHNOLOGY TRENDS
MATCH (s:Solution {isPrivate:false})<-[:INFLUENCE]-(tt:TechnologyTrend)
RETURN DISTINCT 
    id(s)as ID, 
    s.name as SolutionName, 
    COLLECT (tt.name) as TrendName
~~~

---

