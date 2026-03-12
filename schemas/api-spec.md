# Schema: API Specification

This schema defines the structure for an API specification artifact.

---

## Fields

### Overview
A 1-2 sentence description of what this API does and who consumes it.

### Base URL
The base path for all endpoints. Example: `/api/v1`

### Authentication
How the API is authenticated. Example: Bearer token, API key, OAuth 2.0.

### Endpoints

For each endpoint, define:

```
### [METHOD] /path

**Description**  
What this endpoint does.

**Request**

Headers:
- `Header-Name`: Description

Path parameters:
- `param_name` (type, required): Description

Query parameters:
- `param_name` (type, optional): Description

Body (application/json):
{
  "field_name": "type — description"
}

**Response**

Success: HTTP [status code]
{
  "field_name": "type — description"
}

Errors:
- `400` Bad Request — [when this occurs]
- `401` Unauthorized — [when this occurs]
- `404` Not Found — [when this occurs]
- `500` Internal Server Error — [when this occurs]
```

### Data Types
Define any shared data types or enums used across endpoints.

### Rate Limiting
Rate limiting policy if applicable.

### Versioning
How API versions are managed.

### Open Questions
API design decisions not yet resolved.
