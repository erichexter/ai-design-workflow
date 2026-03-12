# Schema: Product Requirements

This schema defines the structure for a product requirements artifact.

---

## Fields

### Overview
A 2-3 sentence description of what is being built and why.

### Problem Reference
Link or reference to the problem definition this addresses.

### Goals
A list of measurable goals this feature or product must achieve.

Format: `[Metric] improves from [current state] to [target state].`

### Non-Goals
Explicit list of things this feature will not do.

### Functional Requirements
A numbered list of required product behaviors.

Each requirement must:
- Start with "The system shall..." or "Users must be able to..."
- Be testable
- Have a priority: Must Have / Should Have / Nice to Have

### Non-Functional Requirements
Requirements related to performance, security, reliability, scalability, and compliance.

### Constraints
Technical, regulatory, or business constraints that limit the solution space.

### Dependencies
External systems, teams, or decisions this work depends on.

### Assumptions
Assumptions made while writing these requirements.

### Open Questions
Questions that must be resolved before implementation begins.

---

## Priorities

- **Must Have** — Required for launch. Work cannot ship without this.
- **Should Have** — Strongly desired. Should be included if feasible.
- **Nice to Have** — Optional. Include only if time and scope allow.
