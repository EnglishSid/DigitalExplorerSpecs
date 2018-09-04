# Solution synchronization details

## Preface

Digital Explorer solutions of type 'DXC Offering Family' are synchronize with WWS using HTTP API.

## Data mapping

| WWS              | Digital Explorer   | 
|:----------------:|:------------------:|
| Offering family  | Practice           |
| Major Offering   | Solution           |
| Sub Offering     | Feature            |


## Sync data rules

- to not delete any **solutions** or **sub offerings** from Digital Explorer
- if Major Offering no longer exists - update status of solution to **"Retired"** and set searchable as "false"
- if sub offering no longer exists - update feature as **"Retired"** (new property) and ensure this is no longer listed for new solutions
  - existing solution retain relationship unless solution owner removes the relationship
- match wws solution fields: 'meta_description', 'page_body'  and wws feature fields: 'name, 'description' against Digital Explorer trends (Business and Technology) and create relationship 
according to DE rules
- WWS is a master for Digital Explorer is terms of those solutions so solutions which are synchronized should contains exactly the same data as WWS
  -  **EXCLUSIONS**  - features, attachments - after synchronization process Digital Explorer Solutions may have relationships to features and attachments before sync
- solution offering family is mapped to industry (and all subIndustries from that industry)
- feature offering family is mapped to technology group
- if feature name is finished on ":Legacy" postfix, remove it and store it in node with name 'namePostFix'
    

## Solution's offering family mapping


| Offering Family                               | Industry                   | 
|:---------------------------------------------:|:--------------------------------------:|
| Analytics                                     | Pan Industry                           |
| Application Services                          | Pan Industry                           |
| Apps Services and Program Excellence          | Pan Industry                           |
| Business Process Services                     | Pan Industry                           |
| Cloud and Platform Services                   | Pan Industry                           |
| Consulting                                    | Pan Industry                           |
| Cross-Offering Solutions                      | Pan Industry                           |
| Enterprise and Cloud Apps                     | Pan Industry                           |
| Enterprise & Cloud Applications               | Pan Industry                           |
| IS&S Insurance                                | Insurance                              |
| IS&S Healthcare & Life Sciences               | Healthcare & Life Sciences             |
| IS&S Banking                                  | Banking & Capital Markets              |
| IS&S Travel and Transportation                | Travel and Transportation              |
| IS&S Travel, Transportation &amp; Hospitality | Pan Industry                           |
| Security                                      | Pan Industry                           |
| Workplace and Mobility                        | Pan Industry                           |


**NOTES** - if you want to update mappings you can find them [here](https://github.houston.entsvcs.net/WWBGraph/wwb-app/blob/master/src/main/resources/sync/solution/industry-mapping.json)]

## Feature's offering family mapping


| Offering Family                               | Technology Group                       | 
|:---------------------------------------------:|:--------------------------------------:|
| Analytics                                     | Data & Analytics                       |
| Application Services                          | Applications                           |
| Apps Services and Program Excellence          | Applications                           |
| Business Process Services                     | Business Process & Information         |
| Cloud and Platform Services                   | Infrastructure                         |
| Consulting                                    | Business Technical Assessment & Design |
| Cross-Offering Solutions                      | Business Process & Information         |
| Enterprise and Cloud Apps                     | Applications                           |
| Enterprise & Cloud Applications               | Applications                           |
| IS&S Insurance                                | Business Process & Information         |
| IS&S Healthcare & Life Sciences               | Business Process & Information         |
| IS&S Banking                                  | Business Process & Information         |
| IS&S Travel and Transportation                | Business Process & Information         |
| IS&S Travel, Transportation &amp; Hospitality | Business Process & Information         |
| Security                                      | Security                               |
| Workplace and Mobility                        | Physical meets Digital                 |


**NOTES** - if you want to update mappings you can find them [here](https://github.houston.entsvcs.net/WWBGraph/wwb-app/blob/master/src/main/resources/sync/solution/technology-group-mapping.json)]


## WWS API Calls

We are using WWS API over HTTP to get data for synchronization. We call API twice:
 - one for solutions - https://api.whatwesell.dxc.com/2.0/query/?&fq_page_type=Major Offering
 - one for features  - https://api.whatwesell.dxc.com/2.0/query/?&fq_page_type=Sub-Offering
 
**NOTES** - not all features that we are consider as a features from solution's call appears within feature's call

### Solution fields mapping

| WWB field                 | DE Solution field                                                         |   
|:-------------------------:|:-------------------------------------------------------------------------:|
| id                        | solution.majorOfferingId                                                  |
| offering_major            | solution.{name}                                                           |
| meta_description          | solution.{elevatorPitch}                                                  |
| page_body                 | solution.{description}                                                    |
| offering_family           | solution-[:INFLUENCE]->practice.{name}                                    |
| contact_email             | solution-[:ASSIGNED {role:("contact_role")}]-person.{email}<br> we may need to check and validate if person node exists if contact_role is empty default to "Solution owner" |
| url                       | solution-[:DESCRIBEDBY]->(:Attachment)-[:ofType]->(:DocumentationCategory)|
| offering                  | solution-[:REALIZEDBY]->(:Feature)                                        |

### Feature fields mapping

| WWB field                 | DE Feature field                                                          |   
|:-------------------------:|:-------------------------------------------------------------------------:|
| id                        | feature.offeringId                                                        |
| offering_sub              | feature.{name}                                                            |
| meta_description          | feature.{description}                                                     |

## Configuration properties

Configuration details is placed within application files (common and environment - environment defines or replaces values from common) 

- [COMMON](https://github.houston.entsvcs.net/WWBGraph/wwb-app/blob/master/src/main/resources/application.yml) 
- [DEV](https://github.houston.entsvcs.net/WWBGraph/wwb-app/blob/master/src/main/resources/application-dev.yml)
- [INT](https://github.houston.entsvcs.net/WWBGraph/wwb-app/blob/master/src/main/resources/application-int.yml)
- [PROD](https://github.houston.entsvcs.net/WWBGraph/wwb-app/blob/master/src/main/resources/application-prod.yml)

```
wwb:
  sync:
    mappings:
      industry: /sync/solution/industry-mapping.json                        # industry file mapping
      technology-group: /sync/solution/technology-group-mapping.json        # technologyGroup file mapping
    api:
      authorization-header: Bearer *****                                    # authorization to WWS API
      base-query-url: https://api.whatwesell.dxc.com/2.0/query              # base API URL query - subqueries are hardcoded
      connect-timeout: 3000                                                 # time to get connection from connection manager
      connection-request-timeout: 7000                                      # time to established connection with client 
      socket-timeout: 5000                                                  # time waiting for data
    data:
      cron-expression: '0 0 6 ? * MON'                                      # execution date - every monday at 6 am          
      username: wws-synch-data@dxc.com                                      # userName to set as solution modifier or creator
      is-real-sync: true                                                    # if false - all calculation will be performed but modifications wouldn't be stored
                                                                            # otherwise whole process will be performed 
```

## Execution

Synchronization was set up at 06:00 AM on each Monday (server time), but there is a possibility to run synchronization ad hoc.

| Action name                        |     SECURITY ROLE             |   Link |
|------------------------------------|-------------------------------|--------|
| Run synchronization                | SolutionSynchronizationAdmin  | [usage](https://ec4t02050.itcs.entsvcs.com/wwb/swagger-ui.html#/solution-sync-controller/runSynchronizationUsingGET)|

