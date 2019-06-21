# DXC Digital Explorer Open API's

Internal DXC application owners can request access to the DE API's via an access token by contacting the DE team 


## Available DXC internal API's

### Business Trends
- Data restrictions : None

`https://digitalexplorer.dxc.com/wwb/api/trends/business/all`

~~~
[
  {
    "author": {
      "email": "string",
      "id": 0,
      "lastLoginDate": 0,
      "name": "string",
      "roles": [
        {
          "name": "string"
        }
      ]
    },
    "businessLinks": [
      {
        "author": {
          "email": "string",
          "id": 0,
          "lastLoginDate": 0,
          "name": "string",
          "roles": [
            {
              "name": "string"
            }
          ]
        },
        "businessArea": "string",
        "description": "string",
        "id": 0,
        "industry": "string",
        "lifecycleStage": "string",
        "subIndustry": "string"
      }
    ],
    "createDate": "2019-06-21T07:50:18.623Z",
    "description": "string",
    "id": 0,
    "name": "string",
    "order": 0,
    "reference": "string",
    "source": "string"
  }
]
~~~

### Technology Trends
- Data restrictions : None

`https://digitalexplorer.dxc.com/wwb/api/trends/technology/all`
~~~
[
  {
    "author": {
      "email": "string",
      "id": 0,
      "lastLoginDate": 0,
      "name": "string",
      "roles": [
        {
          "name": "string"
        }
      ]
    },
    "createDate": "2019-06-21T07:53:44.648Z",
    "description": "string",
    "id": 0,
    "lifecycleStage": "string",
    "name": "string",
    "order": 0,
    "reference": "string",
    "source": "string",
    "technologyGroup": "string"
  }
]
~~~

### Industries
- Data restrictions : None

`https://digitalexplorer.dxc.com/wwb/api/admin/meta/industries/hierarchy`

~~~
[
  {
    "name": "string",
    "subIndustries": [
      {
        "businessAreas": [
          {
            "description": "string",
            "name": "string",
            "order": 0
          }
        ],
        "name": "string"
      }
    ]
  }
]
~~~

### Solutions
- Data restrictions : Searchable solutions

Parameters
`limit` : number of solutions returned per page


`https://digitalexplorer.dxc.com/wwb/api/search?limit=10&order=DEFAULT&skip=0&type=ALL`


~~~
{
  "count": 0,
  "effectiveFilterValues": {
    "categories": [
      "string"
    ],
    "industries": [
      "string"
    ],
    "practices": [
      "string"
    ],
    "referenceables": [
      "string"
    ],
    "solutionTypes": [
      "string"
    ],
    "statuses": [
      "string"
    ],
    "tags": [
      "string"
    ]
  },
  "keyWords": "string",
  "limit": 0,
  "queryTime": 0,
  "results": {},
  "skip": 0
}
~~~

### Playbooks

- Data restrictions : Only public playbooks

`https://digitalexplorer.dxc.com/wwb/api/playbook?withoutPrivate=false`


~~~

~~~


