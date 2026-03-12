# Using This Library

The prompt files in `prompts/` are the source of truth. They are plain markdown, portable across any AI tool.

The `opencode/` folder contains pre-built integrations for OpenCode. Do not edit those files directly — if a prompt changes, update the source in `prompts/` and reflect the change in `opencode/` accordingly.

---

## Claude / ChatGPT

1. Open the prompt file from `prompts/`
2. Copy the full contents
3. Paste into a new conversation
4. Replace `{{INPUT}}` with your actual input

No setup required. Works in Claude.ai, ChatGPT, or any chat interface.

---

## OpenCode

OpenCode uses two mechanisms from this library: **commands** and **skills**.

### Commands (`/dw-*`)

Commands are short prompts you invoke directly by typing `/dw-` in the OpenCode TUI.

**Setup (global — available in all projects):**

```bash
cp -r opencode/commands/* ~/.config/opencode/commands/
```

**Setup (per-project — available in one repo only):**

```bash
cp -r opencode/commands/* .opencode/commands/
```

**Usage:**

```
/dw-define-problem describe the problem here
/dw-generate-product-requirements paste requirements notes here
/dw-generate-user-stories based on the requirements we just defined
/dw-propose-architecture-options using the requirements above
```

Everything after the command name is passed as input. You can also paste multi-line content after triggering the command.

**Available commands:**

| Command | Purpose |
|---|---|
| `/dw-define-problem` | Turn a vague idea into a scoped problem statement |
| `/dw-clarify-feature-idea` | Surface questions to sharpen a rough idea |
| `/dw-identify-user-personas` | Identify distinct user types for a feature |
| `/dw-extract-requirements-from-notes` | Pull requirements from raw notes or transcripts |
| `/dw-generate-product-requirements` | Generate structured requirements from an idea |
| `/dw-generate-user-stories` | Convert requirements into user stories |
| `/dw-generate-acceptance-criteria` | Write Given/When/Then criteria for stories |
| `/dw-propose-architecture-options` | Generate architecture options with tradeoffs |
| `/dw-review-architecture-design` | Critically review an architecture design |
| `/dw-generate-api-spec` | Produce a structured API specification |
| `/dw-generate-implementation-plan` | Break work into sequenced, estimated tasks |
| `/dw-identify-technical-risks` | Surface risks before implementation begins |
| `/dw-identify-edge-cases` | Find boundary conditions a design must handle |
| `/dw-evaluate-architecture-tradeoffs` | Compare architectural approaches |
| `/dw-summarize-meeting-notes` | Extract decisions, actions, and open questions |

---

### Skills (`dw-requirements-discovery`)

The requirements discovery prompt is long and interactive — it runs as an **Agent Skill** so OpenCode loads it on demand rather than including it in every session's context.

**Setup (global):**

```bash
cp -r opencode/skills/dw-requirements-discovery ~/.config/opencode/skills/
```

**Setup (per-project):**

```bash
cp -r opencode/skills/dw-requirements-discovery .opencode/skills/
```

**Usage:**

The agent will automatically discover and use this skill when you ask it to gather requirements. You can also trigger it explicitly:

```
Use the dw-requirements-discovery skill to help me define requirements for a new feature
```

---

## Keeping Commands Up To Date

When a prompt in `prompts/` is updated:

1. Update the matching file in `opencode/commands/` (same content, frontmatter + `$ARGUMENTS` instead of `{{INPUT}}`)
2. Re-copy the updated command to your `~/.config/opencode/commands/` or `.opencode/commands/`

There is no auto-sync — it is a manual copy step.

---

## Workflow Usage

Workflows in `workflows/` are reference documents, not executable commands. Open the relevant workflow file, follow the steps, and run the corresponding `/dw-*` command at each step.
