~~~
CREATE (i:Industry { name:'Banking & Capital Markets' })
CREATE (si1:SubIndustry { name:'Banking' })
CREATE (si2:SubIndustry { name:'Insurance' }) 
CREATE (si3:SubIndustry { name:'Professional Services' })

CREATE (ba1:BusinessArea { name:'Business Models' })
CREATE (ba2:BusinessArea { name:'Internal Operations' }) 
CREATE (ba3:BusinessArea { name:'Payments' })
CREATE (ba4:BusinessArea { name:'Customer' })
CREATE (ba5:BusinessArea { name:'Operational Integrity' })

CREATE (btl1:BusinessTrendLink {description: 'desc1'})
CREATE (btl2:BusinessTrendLink {description: 'desc2'})
CREATE (btl3:BusinessTrendLink {description: 'desc3'})
CREATE (btl4:BusinessTrendLink {description: 'desc4'})
CREATE (btl5:BusinessTrendLink {description: 'desc5'})
CREATE (btl6:BusinessTrendLink {description: 'desc6'})
CREATE (btl7:BusinessTrendLink {description: 'desc7'})
CREATE (btl8:BusinessTrendLink {description: 'desc8'})
~~~~

~~~~

MATCH (n) WHERE labels(n) IN ['Industry', 'SubIndustry'] RETURN count(n) 
~~~

returns zero results


