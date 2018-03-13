![WorkspaceModel](../images/workspacesMetaModel.png)

####**Node Definitions**

#####Node Label: Workspace

|Property|default value (if any)|
|----|----|
|id|system generated
|Name |


#####Node Label: Workspace Note

|Property|default value (if any)|
|----|----|
|id|system generated
|text|
|workspaceID|

#####Node Label: Attachment

|Property|default value (if any)|
|----|----|
|id|system generated
|Name|
|docType|
|type|MEDIA
|uri|


####Relationships

|Source|Destination|Name|Properties|
|----|----|----|----|
|Person|Workspace|MEMBER_OF
|Attachment|Workspace|INCLUDES
|BusinessTrend|Workspace|INCLUDES
|Technology|TrendWorkspace|INCLUDES
|Person|Workspace|REFERENCED
|Solution|Workspace|REFERENCED
|WorkspaceNote|Workspace|INCLUDES


