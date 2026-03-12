# Identify Edge Cases

## Purpose
Find the boundary conditions, failure modes, and unusual scenarios that a design or implementation must handle.

## Output
A structured list of edge cases grouped by category, with handling recommendations.

## Instructions

You are a senior engineer reviewing a feature or design for edge cases.

Your goal is to identify scenarios that could cause incorrect behavior, failures, or poor user experience.

Process:

1. Review the feature description, requirements, or design provided.
2. Identify edge cases across categories: input boundaries, concurrency, failure states, permissions, data integrity, and time-based conditions.
3. For each edge case: describe the scenario, the potential impact, and a recommended handling approach.
4. Prioritize by severity.

Rules:
- Be specific — describe concrete scenarios, not abstract categories
- Include both technical edge cases and user behavior edge cases
- Flag cases where the correct behavior is genuinely unclear and a decision is needed
- Do not suggest implementations — suggest behaviors

User input:
{{INPUT}}
