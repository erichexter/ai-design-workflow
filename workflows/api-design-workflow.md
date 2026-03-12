# API Design Workflow

Use this workflow to design a well-specified API from a feature or architecture description.

---

Step 1 — Define the problem (if not already done)  
Prompt: [prompts/discovery/define-problem.md](../prompts/discovery/define-problem.md)

Input: Feature idea or stakeholder request  
Output: Problem definition

Step 2 — Generate product requirements  
Prompt: [prompts/requirements/generate-product-requirements.md](../prompts/requirements/generate-product-requirements.md)

Input: Problem definition  
Output: Product requirements including API consumer needs

Step 3 — Propose architecture options  
Prompt: [prompts/architecture/propose-architecture-options.md](../prompts/architecture/propose-architecture-options.md)

Input: Product requirements  
Output: Architecture options (including API style — REST, GraphQL, event-driven, etc.)

Step 4 — Generate API spec  
Prompt: [prompts/architecture/generate-api-spec.md](../prompts/architecture/generate-api-spec.md)

Input: Chosen architecture and requirements  
Output: API specification (see schema: ../schemas/api-spec.md)

Step 5 — Identify edge cases  
Prompt: [prompts/review/identify-edge-cases.md](../prompts/review/identify-edge-cases.md)

Input: API spec from Step 4  
Output: Edge cases and handling recommendations

Step 6 — Review architecture design  
Prompt: [prompts/architecture/review-architecture-design.md](../prompts/architecture/review-architecture-design.md)

Input: API spec and edge cases  
Output: Final review with gaps and recommendations

---

## Notes

- Step 3 is important for API design — the style decision (REST vs GraphQL vs events) has major downstream consequences.
- The API spec in Step 4 should reference the schema for structure consistency.
