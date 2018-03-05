
Trend Description = Trend Name
~~~
MATCH (bt:BusinessTrend)-[ASSIGNED]->(btl:BusinessTrendLink)<-[ASSIGNED_VIA]-(ba:BusinessArea)-[VALUEOF]->(si:SubIndustry)
WHERE bt.name=bt.description
RETURN bt.name, bt.description, ba.name,si.name
~~~


Industry Description = Trend Description
~~~~
MATCH  (bt:BusinessTrend)-[ASSIGNED]->(btl:BusinessTrendLink)<-[ASSIGNED_VIA]-(ba:BusinessArea)-[VALUEOF]->(si:SubIndustry)
WHERE  bt.description=btl.description
RETURN bt.name, bt.description, btl.description, ba.name,si.name
~~~~


description contains name
~~~~
match (bt:BusinessTrend)
where bt.name<>bt.description
with bt
match (bt2:BusinessTrend) 
where bt2.description contains bt.name
return bt2
~~~~

variant with details

~~~~
match (bt:BusinessTrend)
where bt.name<>bt.description
with bt
match (bt2:BusinessTrend) 
where bt2.description contains bt.name
return bt.name, bt2.name, bt2.description
~~~~

## GraphAware NLP


testing against one trend

~~~
MATCH (n:BusinessTrend) where n.name="Internet of Things"
CALL ga.nlp.annotate({text: n.description, id: id(n)})
YIELD result
MERGE (n)-[:HAS_ANNOTATED_TEXT]->(result)
RETURN result
~~~

~~~
MATCH (n:BusinessTrend) where n.name="Mixed Reality"
CALL ga.nlp.annotate({text: n.description, id: id(n), checkLanguage: false}) 
YIELD result
MERGE (n)-[:HAS_ANNOTATED_TEXT]->(result)
RETURN result
~~~

