

![SolutionMetaModel.png](../images/SolutionMetaModel.png)

####**Node Definitions**

#####Node Label: Solution

|Property|default value (if any)|
|----|----|
|id|system generated
|ObjectClass|Archimate_Product
|Name |
|Description 
|elevatorPitch
|generalValue
|creationDate
|lastModificationDate
|referenceable|No
|searchable|Yes



#####Node Label: Motivation

|Property|default value (if any)|
|----|----|
|id|system generated
|ObjectClass|Archimate_Driver
|Name |
|Description


#####Node Label: Feature

|Property|default value (if any)|
|----|----|
|id|system generated
|ObjectClass|Archimate_Service
|Name |
|Description  



#####Node Label: FeatureSet

|Property|default value (if any)|
|----|----|
|id|system generated
|Name |
|Description  


#####Node Label: Person
Readonly

|Property|default value (if any)|
|----|----|
|id|system generated
|Name|as defined in Global Pass
|email|as defined in Global Pass
|ObjectClass|Archimate_Product

#####Node Label: TechnologyTrend
Readonly

|Property|default value (if any)|
|----|----|
|id|system generated
|Name |
|Description  

#####Node Label: BusinessTrend
Readonly

|Property|default value (if any)|
|----|----|
|id|system generated
|Name |
|Description  

#####Node Label: SubIndustry
Readonly

|Property|default value (if any)|
|----|----|
|id|system generated
|Name |
|Description  

#####Node Label: Industry
Readonly

|Property|default value (if any)|
|----|----|
|id|system generated
|Name |
|Description  

#####Node Label: Account
Readonly

|Property|default value (if any)|
|----|----|
|id|system generated
|Name |

#####Node Label: Category
Readonly

|Property|default value (if any)|
|----|----|
|id|system generated
|Name |

#####Node Label: offeringFamily
Readonly

|Property|default value (if any)|
|----|----|
|id|system generated
|Name |

#####Node Label: technologyGroup
Readonly

|Property|default value (if any)|
|----|----|
|id|system generated
|Name |
|Description  

#####Node Label: FeatureCategory
Readonly

|Property|default value (if any)|
|----|----|
|id|system generated
|Name |
|Description  


####Relationships

|Source|Destination|Name|Properties|
|----|----|----|----|
|Motivation|Solution|INFLUENCE
|TechnologyTrend|Solution|INFLUENCE
|BusinessTrend|Solution|INFLUENCE
|Person|Solution|ASSIGNED|{role}
|Solution|Feature|REALIZED_BY
|FeatureSet|Feature|REALIZED_BY
|Feature|FeatureCategory|OFCATEGORY
|Feature|TechnologyGroup|ASSOCIATED_TO
|Solution|OfferingFamily|ASSOCIATED_TO
|Solution|Category|ASSOCIATED_TO
|Solution|Account|ASSIGNED
|Solution|Category|ASSIGNED
|Account|SubIndustry|ASSIGNED
|SubIndustry|Industry|VALUEOF

