# Queries used

## Top 10 trends
~~~
match (i:Industry)--(si:SubIndustry)--(a:Account)--(ia:InnovationAgenda)--(cvc:ClientValueChain)--(cd:ClientDisruptor)-[:SPECIALIZES]->(trend)
return trend.name, count(trend) order by count(trend) desc
limit 10
~~~


## top 10 focus trends
~~~
//count of disruptors for a region
match (cd:ClientDisruptor)-[:SPECIALIZES]->(trend)
where cd.focusArea = true
return trend.name, count(trend) order by count(trend) desc
LIMIT 10
~~~


##  Top 10 Strategic Trends
~~~
//Calculate
MATCH (csi:ClientStrategicInitiative)-[]->(:ClientDisruptor)-[:SPECIALIZES]->(trend)
WITH count(DISTINCT csi) AS total
MATCH (csi:ClientStrategicInitiative)-[]->(cd:ClientDisruptor)-[:SPECIALIZES]->(trend)
WITH csi, collect(trend.name) AS col, total
//Create grouping node
MERGE (t:test {name:col})
//convert list to string
WITH REDUCE (s = HEAD(col), n IN TAIL(col) | s + ', ' + n) AS result,t
//now split into new nodes
WITH split(tolower(result), ',') AS keyTrends,result,t
UNWIND range (0,size(keyTrends)-1) as i 
MERGE (ac:KeyTrend {name:keyTrends[i]})-[:ITEM]->(t)
return t,ac
~~~

### return the results
~~~
MATCH (kt:KeyTrend)-[]-(t:test)
WITH  t, COLLECT(t) AS nodelist, COUNT(*) AS count
WHERE count > 6
with t
match (kt:KeyTrend)-[]-(t)
return kt,t
~~~

## top 10 trends by solution
~~~
//count of disruptors for a region
match (cd:ClientDisruptor)-[:SPECIALIZES]->(trend)
where cd.focusArea = true
return trend.name, count(trend) order by count(trend) desc
LIMIT 10
~~~