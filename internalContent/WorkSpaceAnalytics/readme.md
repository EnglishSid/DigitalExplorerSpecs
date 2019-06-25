

~~~
match (wsg:WorkspaceGroup {name:'NCE TOP 10 Customers'})--(ws:Workspace)-[r]-(c)
with c,count(c) as Content
return c.name, Content, labels(c) as type
order by Content desc
~~~