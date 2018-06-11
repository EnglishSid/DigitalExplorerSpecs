match (f:Feature)-[r:REALIZEDBY]-(tg:TechnologyGroup)
where f.name ="Similarity based search"
delete r

match (f:Feature {name:"Similarity based search"})
with f
MERGE (f)<-[:REALIZEDBY]-(tg:TechnologyGroup{name:"Data & Analytics"})
return f,tg


match (f:Feature)-[r:REALIZEDBY]-(tg:TechnologyGroup)
where f.name ="Cloud native application development"
delete r

match (f:Feature {name:"Cloud native application development"})
with f
MERGE (f)<-[:REALIZEDBY]-(tg:TechnologyGroup{name:"Applications"})
return f,tg


match (f:Feature)-[r:REALIZEDBY]-(tg:TechnologyGroup)
where f.name ="Accelerated Solution Development"
delete r

match (f:Feature {name:"Accelerated Solution Development"})
with f
MERGE (f)<-[:REALIZEDBY]-(tg:TechnologyGroup{name:"Business Process & Information"})
return f,tg


match (f:Feature)-[r:REALIZEDBY]-(tg:TechnologyGroup)
where f.name ="Augmented Reality"
delete r

match (f:Feature {name:"Augmented Reality"})
with f
MERGE (f)<-[:REALIZEDBY]-(tg:TechnologyGroup{name:"Physical meets Digital"})
return f,tg


match (f:Feature)-[r:REALIZEDBY]-(tg:TechnologyGroup)
where f.name ="Location Analytics"
delete r

match (f:Feature {name:"Location Analytics"})
with f
MERGE (f)<-[:REALIZEDBY]-(tg:TechnologyGroup{name:"Data & Analytics"})
return f,tg

match (f:Feature)-[r:REALIZEDBY]-(tg:TechnologyGroup)
where f.name ="Integration"
delete r

match (f:Feature {name:"Integration"})
with f
MERGE (f)<-[:REALIZEDBY]-(tg:TechnologyGroup{name:"Integration & Composition"})
return f,tg

match (f:Feature)-[r:REALIZEDBY]-(tg:TechnologyGroup)
where f.name ="Desktop and Mobile ready"
delete r

match (f:Feature {name:"Desktop and Mobile ready"})
with f
MERGE (f)<-[:REALIZEDBY]-(tg:TechnologyGroup{name:"Applications"})
return f,tg

match (f:Feature)-[r:REALIZEDBY]-(tg:TechnologyGroup)
where f.name ="Customer Analytics"
delete r

match (f:Feature {name:"Customer Analytics"})
with f
MERGE (f)<-[:REALIZEDBY]-(tg:TechnologyGroup{name:"Data & Analytics"})
return f,tg


match (f:Feature)-[r:REALIZEDBY]-(tg:TechnologyGroup)
where f.name ="Graph datamodel"
delete r

match (f:Feature {name:"Graph datamodel"})
with f
MERGE (f)<-[:REALIZEDBY]-(tg:TechnologyGroup{name:"Data & Analytics"})
return f,tg

match (f:Feature)-[r:REALIZEDBY]-(tg:TechnologyGroup)
where f.name ="Outdoor Navigation"
delete r

match (f:Feature {name:"Outdoor Navigation"})
with f
MERGE (f)<-[:REALIZEDBY]-(tg:TechnologyGroup{name:"Network"})
return f,tg


match (f:Feature)-[r:REALIZEDBY]-(tg:TechnologyGroup)
where f.name ="Advanced Compromise Assessment"
delete r

match (f:Feature {name:"Advanced Compromise Assessment"})
with f
MERGE (f)<-[:REALIZEDBY]-(tg:TechnologyGroup{name:"Business Process & Information"})
return f,tg

match (f:Feature)-[r:REALIZEDBY]-(tg:TechnologyGroup)
where f.name ="Loyalty"
delete r

match (f:Feature {name:"Loyalty"})
with f
MERGE (f)<-[:REALIZEDBY]-(tg:TechnologyGroup{name:"Business Process & Information"})
return f,tg

match (f:Feature)-[r:REALIZEDBY]-(tg:TechnologyGroup)
where f.name ="Xchanging Insurance Claims"
delete r

match (f:Feature {name:"Xchanging Insurance Claims"})
with f
MERGE (f)<-[:REALIZEDBY]-(tg:TechnologyGroup{name:"Business Process & Information"})
return f,tg

match (f:Feature)-[r:REALIZEDBY]-(tg:TechnologyGroup)
where f.name ="OmniLocation"
delete r

match (f:Feature {name:"OmniLocation"})
with f
MERGE (f)<-[:REALIZEDBY]-(tg:TechnologyGroup{name:"Business Process & Information"})
return f,tg


match (f:Feature)-[r:REALIZEDBY]-(tg:TechnologyGroup)
where f.name ="Business Process Services Advisory"
delete r

match (f:Feature {name:"Business Process Services Advisory"})
with f
MERGE (f)<-[:REALIZEDBY]-(tg:TechnologyGroup{name:"Business Process & Information"})
return f,tg

match (f:Feature)-[r:REALIZEDBY]-(tg:TechnologyGroup)
where f.name ="Azure"
delete r

match (f:Feature {name:"Azure"})
with f
MERGE (f)<-[:REALIZEDBY]-(tg:TechnologyGroup{name:"Infrastructure"})
return f,tg


match (f:Feature)-[r:REALIZEDBY]-(tg:TechnologyGroup)
where f.name ="Microsoft Azure"
delete r

match (f:Feature {name:"Microsoft Azure"})
with f
MERGE (f)<-[:REALIZEDBY]-(tg:TechnologyGroup{name:"Infrastructure"})
return f,tg

match (f:Feature)-[r:REALIZEDBY]-(tg:TechnologyGroup)
where f.name ="Digital Content"
delete r

match (f:Feature {name:"Digital Content"})
with f
MERGE (f)<-[:REALIZEDBY]-(tg:TechnologyGroup{name:"Business Process & Information"})
return f,tg

match (f:Feature)-[r:REALIZEDBY]-(tg:TechnologyGroup)
where f.name ="Customer Loyalty"
delete r

match (f:Feature {name:"Customer Loyalty"})
with f
MERGE (f)<-[:REALIZEDBY]-(tg:TechnologyGroup{name:"Business Process & Information"})
return f,tg

match (f:Feature)-[r:REALIZEDBY]-(tg:TechnologyGroup)
where f.name ="DXC Digital Utilities Solutions for SAP"
delete r

match (f:Feature {name:"DXC Digital Utilities Solutions for SAP"})
with f
MERGE (f)<-[:REALIZEDBY]-(tg:TechnologyGroup{name:"Data & Analytics"})
return f,tg


match (f:Feature)-[r:REALIZEDBY]-(tg:TechnologyGroup)
where f.name ="Configurability"
delete r

match (f:Feature {name:"Configurability"})
with f
MERGE (f)<-[:REALIZEDBY]-(tg:TechnologyGroup{name:"System Management & Operations"})
return f,tg

match (f:Feature)-[r:REALIZEDBY]-(tg:TechnologyGroup)
where f.name ="Agile Applications Development"
delete r

match (f:Feature {name:"Agile Applications Development"})
with f
MERGE (f)<-[:REALIZEDBY]-(tg:TechnologyGroup{name:"Business Process & Information"})
return f,tg


match (f:Feature)-[r:REALIZEDBY]-(tg:TechnologyGroup)
where f.name ="Mobile Ticketing"
delete r

match (f:Feature {name:"Mobile Ticketing"})
with f
MERGE (f)<-[:REALIZEDBY]-(tg:TechnologyGroup{name:"Applications"})
return f,tg

match (f:Feature)-[r:REALIZEDBY]-(tg:TechnologyGroup)
where f.name ="Archiving"
delete r

match (f:Feature {name:"Archiving"})
with f
MERGE (f)<-[:REALIZEDBY]-(tg:TechnologyGroup{name:"Business Process & Information"})
return f,tg

match (f:Feature)-[r:REALIZEDBY]-(tg:TechnologyGroup)
where f.name ="Microsoft Hololens"
delete r

match (f:Feature {name:"Microsoft Hololens"})
with f
MERGE (f)<-[:REALIZEDBY]-(tg:TechnologyGroup{name:"Physical meets Digital"})
return f,tg

match (f:Feature)-[r:REALIZEDBY]-(tg:TechnologyGroup)
where f.name ="Mobile First Wireless Network"
delete r

match (f:Feature {name:"Mobile First Wireless Network"})
with f
MERGE (f)<-[:REALIZEDBY]-(tg:TechnologyGroup{name:"Network"})
return f,tg

match (f:Feature)-[r:REALIZEDBY]-(tg:TechnologyGroup)
where f.name ="Data visualization"
delete r

match (f:Feature {name:"Data visualization"})
with f
MERGE (f)<-[:REALIZEDBY]-(tg:TechnologyGroup{name:"Data & Analytics"})
return f,tg

match (f:Feature)-[r:REALIZEDBY]-(tg:TechnologyGroup)
where f.name ="Network Services"
delete r

match (f:Feature {name:"Network Services"})
with f
MERGE (f)<-[:REALIZEDBY]-(tg:TechnologyGroup{name:"Network"})
return f,tg

match (f:Feature)-[r:REALIZEDBY]-(tg:TechnologyGroup)
where f.name ="Data Analytics"
delete r

match (f:Feature {name:"Data Analytics"})
with f
MERGE (f)<-[:REALIZEDBY]-(tg:TechnologyGroup{name:"Data & Analytics"})
return f,tg

match (f:Feature)-[r:REALIZEDBY]-(tg:TechnologyGroup)
where f.name ="Multisupplier Integration and ITSM-ESM Services"
delete r

match (f:Feature {name:"Multisupplier Integration and ITSM-ESM Services"})
with f
MERGE (f)<-[:REALIZEDBY]-(tg:TechnologyGroup{name:"System Management & Operations"})
return f,tg



match (f:Feature)-[r:REALIZEDBY]-(tg:TechnologyGroup)
where f.name ="Enterprise and Cloud Apps Advisory"
delete r

match (f:Feature {name:"Enterprise and Cloud Apps Advisory"})
with f
MERGE (f)<-[:REALIZEDBY]-(tg:TechnologyGroup{name:"Business Technical Assessment & Design"})
return f,tg

match (f:Feature)-[r:REALIZEDBY]-(tg:TechnologyGroup)
where f.name ="Advanced Compromise Assessment"
delete r

match (f:Feature {name:"Advanced Compromise Assessment"})
with f
MERGE (f)<-[:REALIZEDBY]-(tg:TechnologyGroup{name:"Business Technical Assessment & Design"})
return f,tg

match (f:Feature)-[r:REALIZEDBY]-(tg:TechnologyGroup)
where f.name ="Holographic Form"
delete r

match (f:Feature {name:"Holographic Form"})
with f
MERGE (f)<-[:REALIZEDBY]-(tg:TechnologyGroup{name:"Physical meets Digital"})
return f,tg


match (f:Feature)-[r:REALIZEDBY]-(tg:TechnologyGroup)
where f.name ="Location Sharing"
delete r

match (f:Feature {name:"Location Sharing"})
with f
MERGE (f)<-[:REALIZEDBY]-(tg:TechnologyGroup{name:"Network"})
return f,tg