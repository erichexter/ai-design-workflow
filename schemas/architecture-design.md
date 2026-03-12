# Schema: Architecture Design

This schema defines the structure for an architecture design artifact.

---

## Fields

### Overview
A 2-3 sentence summary of the architecture and the key design decision made.

### Context
What problem this architecture solves. Reference the problem definition or requirements.

### Design

#### Components
List each major component with:
- Name
- Responsibility
- Technology (if decided)

#### Interactions
Describe how components interact. Include sequence or data flow where helpful.

#### Data Model
Key entities and their relationships. Not a full schema — just the essential structure.

#### Infrastructure
Deployment topology. Where components run and how they are connected.

### Design Decisions
List the key decisions made and the rationale for each.

Format:
```
Decision: [What was decided]
Rationale: [Why this choice was made]
Alternatives considered: [What else was evaluated]
```

### Tradeoffs
What this design gives up in exchange for what it gains.

### Risks
Known risks in this design. Reference the technical risk list if available.

### Open Questions
Architectural questions not yet resolved.

### Out of Scope
What this design explicitly does not cover.
