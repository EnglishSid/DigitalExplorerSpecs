# Account bulk load and program assignment

## CSV file format

`AccountName,Industry,SubIndustry`

## Account Load
~~~
//Create the accounts
LOAD csv with headers from "file:///UKaccounts.csv" as loadFile
MERGE (a:Account{name:loadFile.AccountName})
//Now map to the Subindustry
WITH a, loadFile
MATCH (si:SubIndustry {name:loadFile.SubIndustry})
MERGE (a)-[r:ACCOUNT_TO_SUBINDUSTRY]->(si)
RETURN a,si
~~~

## Account 2 Region
~~~
//Load the file
LOAD csv with headers from "file:///UKaccounts.csv" as loadFile
MATCH (a:Account{name:loadFile.AccountName}),(r:Region{name:'UKIIMEA'})
MERGE (a)-[:ACCOUNT_IN_REGION]->(r)
RETURN a,r
~~~


## CT mapping
~~~
//Load the file
LOAD csv with headers from "file:///UKaccounts.csv" as loadFile
//Find the person and account in the database
MATCH (a:Account{name:loadFile.AccountName}),(p:Person{name:loadFile.PersonName})
//Create the relationship
MERGE (p)-[r:PERSON_IN_ACCOUNT {role:'Account CT'}]->(a)
RETURN p,a


~~~

## Account 2 Internal Program (optional)
**Check the name of the program group**
~~~
//Load the file
LOAD csv with headers from "file:///UKaccounts.csv" as loadFile
MATCH (a:Account{name:loadFile.AccountName}),(ip:DXCInternalProgram{name:'UKIIMEA - DIFP - First 60'})
MERGE (a)-[r:MEMBER_OF]->(ip)
return a,ip
~~~