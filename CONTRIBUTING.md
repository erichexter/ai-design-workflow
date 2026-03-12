# Contributing

When adding a prompt:

1. Use a verb-first filename
2. Follow the prompt template in `templates/prompt-template.md`
   - Simple prompts use the flat `Process:` / `Rules:` structure
   - Complex prompts (multi-step, interactive) may use `###` subsections within `## Instructions` for readability
3. Reference schemas instead of embedding them
4. Keep prompts model-agnostic
5. Avoid company-specific context
6. Keep examples out of prompt files

When adding a workflow:

1. Follow the workflow template in `templates/workflow-template.md`
2. Reference existing prompts by relative path
3. Keep steps sequential and clearly numbered
