# Architecture Design Workflow

Use this workflow to move from product requirements to a reviewed, implementation-ready architecture.

---

Step 1 — Propose architecture options  
Prompt: [prompts/architecture/propose-architecture-options.md](../prompts/architecture/propose-architecture-options.md)

Input: Product requirements or problem definition  
Output: Two to three architecture options with tradeoffs

Step 2 — Evaluate architecture tradeoffs  
Prompt: [prompts/review/evaluate-architecture-tradeoffs.md](../prompts/review/evaluate-architecture-tradeoffs.md)

Input: Architecture options from Step 1  
Output: Comparison matrix and recommendation

Step 3 — Review architecture design  
Prompt: [prompts/architecture/review-architecture-design.md](../prompts/architecture/review-architecture-design.md)

Input: Chosen architecture from Step 2  
Output: Structured review with risks and recommendations

Step 4 — Identify technical risks  
Prompt: [prompts/planning/identify-technical-risks.md](../prompts/planning/identify-technical-risks.md)

Input: Reviewed architecture from Step 3  
Output: Prioritized risk list with mitigations

Step 5 — Generate implementation plan  
Prompt: [prompts/planning/generate-implementation-plan.md](../prompts/planning/generate-implementation-plan.md)

Input: Architecture and risk list  
Output: Implementation plan ready for engineering

---

## Notes

- Steps 1 and 2 can be combined if only one architecture option is being considered.
- Do not skip Step 3 — peer review of architecture is critical before planning begins.
