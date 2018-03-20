# Working Queries and API's for Delivery Explorer

## Get Industries
`https://digitalexplorer.dxc.com/wwb/api/admin/meta/industries`


## Get offering families
`https://digitalexplorer.dxc.com/wwb/api/admin/meta/practices`


## Get all solutions associated with offering family
`wwb/api/search?&practices=Workload%20and%20Cloud%20Solutions&type=ALL`

## Get all solutions with a tag
`wwb/api/search?&tags=Demo&type=ALL`

## Get all solutions with a tag and a named industry
`wwb/api/search?&industries=Pan%20Industry&tags=Demo&type=ALL`

---
# Neo4j Queries

Potential extended queries

## Get all people associated with a named industry

~~~
MATCH (p:Person)--(s:Solution)--(i:Industry)
WHERE i.name="Pan Industry"
RETURN distinct (p.name)
~~~

## Get all solutions associated with a named method (Agile Kanban)

~~~
MATCH (fc:FeatureCategory)--(f:Feature)--(s:Solution)
WHERE fc.name="Method" and f.name="Agile Kanban"
return s.name
~~~

## Get all videos for Industry X 

~~~
MATCH (p:Person)--(s:Solution)--(i:Industry),(s2:Solution)--(a:Attachment)
WHERE i.name="Pan Industry" and a.docType="Video"
RETURN distinct s2.name, a.name
~~~