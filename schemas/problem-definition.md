# Schema: Problem Definition

This schema defines the structure for a problem definition artifact.

---

## Fields

### Problem Statement
A single sentence that clearly states what problem exists, for whom, and what the impact is.

Format: `[Who] experiences [what problem] which causes [what impact].`

### Background
2-4 sentences of context. Why does this problem exist? How was it discovered?

### Affected Users
Who experiences this problem. Reference personas where available.

### Current State
How the problem is currently handled (workarounds, manual processes, existing tools).

### Desired State
What good looks like. Not a solution — a description of the outcome if the problem were solved.

### Scope
What is in scope for solving this problem. What is explicitly out of scope.

### Assumptions
List of assumptions made in defining this problem.

### Open Questions
Questions that must be answered before requirements can be written.

### Related Work
Links to related issues, documents, or prior investigations. (Optional)

---

## Example

**Problem Statement**  
Operations teams experience delays in incident escalation which causes SLA breaches during high-severity incidents.

**Background**  
Discovered during Q3 incident retrospective. Current on-call system does not automatically escalate after a timeout.

**Affected Users**  
On-call engineers, operations leads.

**Current State**  
Engineers manually escalate via Slack after noticing an incident has stalled.

**Desired State**  
Incidents automatically escalate to the next responder after a configurable timeout, without manual intervention.

**Scope**  
In scope: escalation logic, timeout configuration, notification delivery.  
Out of scope: incident creation, alert routing rules.

**Assumptions**  
- Responders are available via the existing on-call schedule.
- Escalation paths are already defined.

**Open Questions**  
- What is the default escalation timeout?
- Should escalation be configurable per incident severity?
