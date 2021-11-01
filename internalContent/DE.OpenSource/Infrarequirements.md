# Infrastructure requirements

## Hosting

- 1 x Linux server (frontend/tomcat)
    - Recommended sizing 4vCPU, 4GB memory, 150GB storage
- 1 x Linux server (or Neo4j community instance)
    - Recommended sizing 8vCPU, 8GB memory, 150GB storage
    - Neo4j community or enterprise v 3.3.5 required

## Backup

Recommendation for production backups

- `/<neohome>/data/database/graph.db`
- `/<frontendhome>/filestore/`

## Authentication

- SAML2 based backend authentication service

### Potential Enhancement

- Self registration within the platform