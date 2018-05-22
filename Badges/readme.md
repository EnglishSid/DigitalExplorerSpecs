# Digital Explorer Badges

Gamifacation within the Digital Explorer platform

## Approach 
Track and recoginize contribution within the platform via achievements and badges.
Allow "tags" to be used within Solutions as a means to create "events/Challenges"


## Content achievements

### Approach
New platform event upon saving content


|Workspaces|Create Workspace|as workspace is created|workspace badge
|Workspaces|Add person to a workspace|as person is added|workspace member badge

### Awards

|Module|Event|Check|NodeName|Shortname|Description
|----|----|----|----|----|
|Solutions|Save Solution|1st Solution|OnboardSolutions|Onboard Solutions|Submitted first solution
|Solutions|Save Solution|5th Solution|Journeyman|Journeyman|Submitted 5th solution
|Solutions|Save Solution|10th Solution|Master|Master|Submitted 10th solution
|Solutions|Save Solution|Feature include an Offering|Family|Keep it in the family|TDB
|Solutions|Save Solution|Feature include an Offering|Family`<name>`|Keep it in the family <name of family>|TDB
|Solutions|Save Solution|Feature include a partner|Friends|We are all friends here|TDB
|Solutions|Save Solution|Feature include a method|Methods|Methods|It’s not what I do, it’s how I do it
|Solutions|Save Solution|Trend included in solution|Innovator|Innovator|TBD
|Solutions|Save Solution|Assigned industry to solution|SolutionIndustrialist|Solution Industrialist|Submit your first solution for a named industry
|Solutions|Save Solution|Assigned industry to solution|SolutionIndustrialist`<name`>|Solution Industrialist `<name`>|Submit your first solution for a named industry
|Solutions|Save Solution|event tag included|EventName|EventName|EventDescription
|Trends|Trend Approved|1st Trend|OnboardTrends|Onboard Trends|Submitted first trend
|Trends|Trend Approved|10th Trend|ThoughtLeader|ThoughtLeader|Submitted 10th trend
|Trends|Trend Approved|Trend 2 Industry|TrendIndustrialist|Trend Industrialist|Submit your first trend for a named industry
|Trends|Trend Approved|Trend 2 Industry|TrendIndustrialist`<name>`|Trend Industrialist `<name>`|Submit your first trend for a named industry
|Agendas|Save Agenda|people assigned to account at time of save|OnboardAgendas|Onboard Agendas|Member of an account team with an innovation agenda
|Agendas|Save Template|created template|Helpinghands|Helping hands|Create your first agenda template
|Agenda|Create Initiative|people assigned to an account at the time a inititive is created|TakingTheNextStep|Taking the next step|Member of an account team who have created a strategic initiative
|Workspaces|Create Workspace|created first workspace|OnboardWorkspaces|Onboard Workspaces|Created first workspace
|Workspaces|Member of a workspace|added as a member of an existing workspace|Membership|Membership|added as a member of an existing workspace


### Q: How will existing content be reviewed?

The majority of content was bulk loaded via PPT2CSV, thus only new content with a submission date after Nov 2017 will be included within the initial data scan to award achievements.

---
## Approach

0. Prep
    - preload Badge Nodes
    - create the support image files

1. Solution Save Event

2. Trend Approval Event

3. Agenda
    - Save Event 
    - Template Save Event
    - Create Initative Event

5. Workspace 
     - Create event
     - Membership event

7. New Tag management Module
     - New Tag management endpoint (add, edit delete)
     - New tag GET endpoint (name, IsEvent, BadgeURI)
     - New GET tag count endpoint (tagid, relastionship count)
     - New tag management UI
     - Update Solution save to support events

