# Schema: Implementation Plan

This schema defines the structure for an implementation plan artifact.

---

## Fields

### Overview
A 2-3 sentence summary of what is being built and the approach.

### References
Links to: requirements, architecture design, API spec, and any other relevant documents.

### Work Areas
Group tasks by area (e.g. Backend, Frontend, Infrastructure, Data Migration, Testing).

### Tasks

For each task:

```
#### [TASK-ID] Task Name

Area: [Backend / Frontend / Infrastructure / etc.]
Effort: [Small (< 1 day) / Medium (1-3 days) / Large (3+ days)]
Dependencies: [List of TASK-IDs this depends on, or "None"]
Owner: [Team or role — not a specific person]
Description: What needs to be done.
Definition of Done: How you know this task is complete.
```

### Critical Path
The sequence of tasks that determines the minimum delivery timeline. List in order.

### Milestones
Key checkpoints with target dates (if known).

| Milestone | Description | Target |
|-----------|-------------|--------|
| M1 | | |
| M2 | | |

### Risks
Implementation risks that could affect the timeline. Reference the technical risk list if available.

### Assumptions
Assumptions made in producing this plan.

### Out of Scope
Work explicitly excluded from this plan.

---

## Effort Guide

- **Small** — Less than one day. Well-understood task with no unknowns.
- **Medium** — One to three days. Some complexity or minor unknowns.
- **Large** — More than three days. Significant complexity or unknowns. Consider breaking down further.
