#NLP review


Trend name = Trend Description
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

### testing against one trend

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

Run against the full dataset (Limit is optional)

~~~
CALL apoc.periodic.iterate(
"MATCH (n:BusinessTrend) RETURN n LIMIT 50",
"CALL ga.nlp.annotate({text: n.description, id: id(n), checkLanguage: false}) 
YIELD result MERGE (n)-[:HAS_ANNOTATED_TEXT]->(result)", {})
~~~


this creates

(BusinessTrend)-[HAS_ANNOTATED_TEXT]->(AnnotatedText)-[CONTAINS_SENTENCE]->(Sentence)-[HAS_TAG]->(Tag)

![image](..\..\..\images\NLPTrendModel.PNG)

Find all Business trends with the same Tag

MATCH (BT:BusinessTrend)-[1..5]-(T:Tag)
RETURN BT,T