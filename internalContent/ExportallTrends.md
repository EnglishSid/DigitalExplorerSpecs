run this script to export all business trends

~~~
match (bt:BusinessTrend)--(btl:BusinessTrendLink)-[r]-(ba:BusinessArea)--(si:SubIndustry)--(i:Industry)
return bt.name as TrendName, ba.name as BusinessArea,btl.description as IndustryDescription, r.lifecycleStage as Stage, si.name as SubIndustry, i.name as Industry 
order by Industry, SubIndustry, TrendName
~~~