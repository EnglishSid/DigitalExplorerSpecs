# Workgroup reporting

**Set of queries to return overall counts of trends and key items from a workgroup**

All follow the same column approach

module, moduleName ,  ItemName, Count , Type


## Workspaces

~~~
match (wsg:WorkspaceGroup {name:'Smart Cities'})
with wsg
match (wsg)-[:MEMBER_OF]-(ws:Workspace)<-[:REFERENCED]-(c)
with wsg,ws,c
match (ws)-[REFERENCED]-(a:Attachment)-[r]-(c)
with wsg,ws,c,r
match (wsg)--(ia:InnovationAgenda)--(cvc:ClientValueChain)--(cd:ClientDisruptor)--(t)
return distinct 'Workspace' as module, ws.name as moduleName ,c.name as ItemName , sum(r.occurrence) as Count, labels(c) as Type
~~~

## Roadmaps

~~~
match (wsg:WorkspaceGroup {name:'Smart Cities'})
with wsg
match (wsg)--(ia:InnovationAgenda)--(cvc:ClientValueChain)--(cd:ClientDisruptor)--(t)
return distinct 
//Roadmap content
'Roadmap' as module, ia.name as moduleName ,cvc.name, t.name as ItemName, '1', labels(t) as iaType
~~~


## Ideas

~~~
match (wsg:WorkspaceGroup {name:'Smart Cities'})
with wsg
match (wsg)--(ia:InnovationAgenda)--(cvc:ClientValueChain)--(cd:ClientDisruptor)--(ci:ClientIdea)
with ci
optional match (ci)--(t)

return distinct 
//Roadmap content
'Ideas' as module, ci.name as moduleName, t.name as ItemName, '1', labels(t) as Type
~~~


## Solutions

