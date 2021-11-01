

~~~
match (wsg:WorkspaceGroup {name:'NCE TOP 10 Customers'})--(ws:Workspace)-[r]-(c)
with c,count(c) as Content
return c.name, Content, labels(c) as type
order by Content desc
~~~


Total count of each item in a **single** workspace
~~~
match (wsg:WorkspaceGroup {name:'CI&R - Americas'})-[:MEMBER_OF]-(ws:Workspace {name:'P&G'})<-[:REFERENCED]-(c)
with wsg,ws,c
match (ws)-[REFERENCED]-(a:Attachment)-[r]-(c)
return distinct c.name, sum(r.occurrence) as totalCount
order by totalCount desc
~~~


Total count of each item within a named **group**
~~~
match (wsg:WorkspaceGroup {name:'CI&R - Americas'})-[:MEMBER_OF]-(ws:Workspace)<-[:REFERENCED]-(c)
with wsg,ws,c
match (ws)-[REFERENCED]-(a:Attachment)-[r]-(c)
return distinct c.name as Item , sum(r.occurrence) as totalCount, labels(c) as Type
order by totalCount desc
~~~



