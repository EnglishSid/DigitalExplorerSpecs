

~~~
//return all content from a named workspace
match (wsg:WorkspaceGroup {name:'NCE TOP 10 Customers'})--(ws:Workspace)--(bt)
with bt, count(bt) as trends
return bt.name, trends, labels(bt) as type
order by trends desc
~~~