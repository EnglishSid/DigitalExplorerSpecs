Reference links to Cypher resources

* [Intro to Cypher (neo4j page)](https://neo4j.com/developer/cypher-query-language/)
* [Cypher Refcard 3.3](https://neo4j.com/docs/cypher-refcard/current/)

Some basic queries to get you started with the DE graph model

Return solutions and features

    match (s:Solution)-[:REALIZEDBY]->(f:Feature) 
    return s, f
    limit 25


Add in the people

    match (s:Solution)-[:REALIZEDBY]->(f:Feature)
    with s,f
    match (s)<-[:ASSIGNED]-(p:Person)
    return s, f,p
    limit 25


Trends influencing Solutions

    MATCH (s:Solution)<-[:INFLUENCE]-(bt:BusinessTrend)
    return s,bt
    limit 25

Same, but return the property values

    MATCH (s:Solution)<-[:INFLUENCE]-(bt:BusinessTrend)
    return s.name,bt.name
    limit 25

return the most connected business trends

    MATCH (n:BusinessTrendLink)<-[:ASSIGNED_VIA]-(t:BusinessTrend) 
    WITH t, COUNT(n) AS connections 
    RETURN id(t) AS id, t.name AS name, connections
    ORDER BY connections DESC LIMIT 5

find the most common/shared features

    MATCH (n:Feature)-[]-(s:Solution)
    WITH  n.name AS Featurename, n.description AS description, COLLECT(n) AS nodelist, COUNT(*) AS count
    WHERE count > 1
    RETURN Featurename,count
    ORDER BY count DESC