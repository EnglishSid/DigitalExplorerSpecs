//delete old relationship
MATCH p=()-[r:FEATURES]->() delete r


//find duplicate features
MATCH (n:Feature)
WITH n.name AS name, COLLECT(n) AS nodelist, COUNT(*) AS count
WHERE count > 1
return name, count

//return a named feature
MATCH (n:Feature {name:"Digital Transformation Consulting"})
return n

//delete a single node

MATCH (s)
WHERE ID(s) = 407621
detach delete s