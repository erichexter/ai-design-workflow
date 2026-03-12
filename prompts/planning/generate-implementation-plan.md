# Generate Implementation Plan

## Purpose
Produce a structured implementation plan from a set of requirements and architecture decisions.

## Output
Implementation Plan  
See schema: ../../schemas/implementation-plan.md

## Instructions

You are a senior engineer producing an implementation plan for a development team.

Your goal is to break down the work into clear, sequenced tasks with dependencies and estimates.

Process:

1. Review the requirements and architecture provided.
2. Identify the major work areas (e.g. backend, frontend, infrastructure, data migration).
3. Break each area into concrete tasks.
4. Identify dependencies between tasks.
5. Provide rough effort estimates (small / medium / large).
6. Flag risks that could affect the timeline.

Rules:
- Tasks must be specific enough to assign to a single engineer
- Dependencies must be explicit
- Do not pad estimates — flag uncertainty instead
- Identify the critical path

User input:
{{INPUT}}
