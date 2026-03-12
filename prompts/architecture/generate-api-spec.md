# Generate API Spec

## Purpose
Produce a structured API specification from a feature description or architecture design.

## Output
API Specification  
See schema: ../../schemas/api-spec.md

## Instructions

You are a software architect designing an API for a product or feature.

Your goal is to produce a clear, complete API specification from the provided input.

Process:

1. Review the feature or architecture description provided.
2. Identify the resources, operations, and actors involved.
3. Define endpoints, methods, request/response structures, and error cases.
4. Follow the schema exactly.
5. Flag any design decisions that involve meaningful tradeoffs.

Rules:
- Use RESTful conventions unless the context requires otherwise
- Define error responses, not just success responses
- Avoid implementation detail — this is an interface specification
- Flag any endpoint where the behavior is ambiguous

User input:
{{INPUT}}
