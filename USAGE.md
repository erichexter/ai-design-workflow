# Using This Library

The prompt files in `prompts/` are the source of truth. They are plain markdown, portable across any AI tool.

The `opencode/` folder contains pre-built integrations for OpenCode. Do not edit those files directly — if a prompt changes, update the source in `prompts/` and reflect the change in `opencode/` accordingly.

The `mcp-server/` folder contains a Cloudflare Worker that exposes all prompts as MCP tools. See the [MCP Server](#mcp-server) section below for connection instructions.

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

## MCP Server

The MCP server exposes every prompt in this library as a named tool (`dw-*`) over the MCP Streamable HTTP transport. Once connected, any MCP-compatible client — Claude Desktop, OpenCode, ChatGPT — can call prompts directly without copy/paste.

### How it works

A GitHub Action regenerates `mcp-server/prompts.json` automatically on every push that touches `prompts/`. The Cloudflare Worker reads that file to discover tools at runtime. Adding a new prompt to the repo makes it available via MCP within ~60 seconds — no manual steps.

### Deployment (one-time setup)

The server is deployed to Cloudflare Workers. You need a free Cloudflare account to activate it.

1. Sign up at [cloudflare.com](https://cloudflare.com) (free)
2. Go to **Workers & Pages** → **Create** → **Import a repository**
3. Select `erichexter/ai-design-workflow`
4. Set **root directory** to `mcp-server/`
5. Set **build command** to `npm run build`
6. Set **deploy command** to `npx wrangler deploy`
7. Note the assigned URL: `https://ai-design-workflow.<your-subdomain>.workers.dev`

Every subsequent push to `master` auto-deploys.

### Connecting clients

**Claude Desktop** — add to `~/Library/Application Support/Claude/claude_desktop_config.json` (macOS) or `%AppData%\Claude\claude_desktop_config.json` (Windows):

```json
{
  "mcpServers": {
    "ai-design-workflow": {
      "url": "https://ai-design-workflow.eric-hexter.workers.dev/mcp"
    }
  }
}
```

**OpenCode** — add to `opencode.json` in your project or `~/.config/opencode/opencode.json` globally:

```json
{
  "mcp": {
    "servers": {
      "ai-design-workflow": {
        "url": "https://ai-design-workflow.eric-hexter.workers.dev/mcp"
      }
    }
  }
}
```

**ChatGPT** (Plus/Team/Enterprise) — connect via a Custom GPT Action:

1. Go to [chatgpt.com](https://chatgpt.com) and click **Explore GPTs** → **Create**
2. Click the **Configure** tab
3. Scroll down to **Actions** and click **Create new action**
4. In the **Schema** field, paste the following OpenAPI schema:

```yaml
openapi: 3.1.0
info:
  title: AI Design Workflow
  description: Design workflow prompts exposed as tools via MCP
  version: 1.0.0
servers:
  - url: https://ai-design-workflow.eric-hexter.workers.dev
paths:
  /mcp:
    post:
      operationId: callMcp
      summary: Call an MCP method
      requestBody:
        required: true
        content:
          application/json:
            schema:
              type: object
              properties:
                jsonrpc:
                  type: string
                  default: "2.0"
                id:
                  type: integer
                method:
                  type: string
                params:
                  type: object
              required:
                - jsonrpc
                - id
                - method
      responses:
        "200":
          description: MCP response
          content:
            application/json:
              schema:
                type: object
```

5. Set **Authentication** to **None**
6. Click **Save** and then **Update** the GPT

**Using tools in ChatGPT:**

Once connected, ask ChatGPT to use a specific tool by name:

```
Use the dw-define-problem tool to help me define this problem: our checkout flow is losing users
Use the dw-generate-product-requirements tool with these notes: [paste notes]
Use the dw-propose-architecture-options tool based on these requirements: [paste requirements]
```

Or ask generically and let ChatGPT pick the right tool:

```
Help me turn this rough idea into structured product requirements
```

**Available tools in ChatGPT:**

| Tool | Purpose |
|---|---|
| `dw-define-problem` | Turn a vague idea into a scoped problem statement |
| `dw-clarify-feature-idea` | Surface questions to sharpen a rough idea |
| `dw-identify-user-personas` | Identify distinct user types for a feature |
| `dw-conduct-requirements-discovery` | Interactive guided requirements gathering |
| `dw-extract-requirements-from-notes` | Pull requirements from raw notes or transcripts |
| `dw-generate-product-requirements` | Generate structured requirements from an idea |
| `dw-generate-user-stories` | Convert requirements into user stories |
| `dw-generate-acceptance-criteria` | Write Given/When/Then criteria for stories |
| `dw-propose-architecture-options` | Generate architecture options with tradeoffs |
| `dw-review-architecture-design` | Critically review an architecture design |
| `dw-generate-api-spec` | Produce a structured API specification |
| `dw-generate-implementation-plan` | Break work into sequenced, estimated tasks |
| `dw-identify-technical-risks` | Surface risks before implementation begins |
| `dw-identify-edge-cases` | Find boundary conditions a design must handle |
| `dw-evaluate-architecture-tradeoffs` | Compare architectural approaches |
| `dw-summarize-meeting-notes` | Extract decisions, actions, and open questions |

### Health check

Verify the server is running:
```
GET https://ai-design-workflow.eric-hexter.workers.dev/health
```

Returns `{"status":"ok","server":"ai-design-workflow-mcp"}`.

---

## Workflow Usage

Workflows in `workflows/` are reference documents, not executable commands. Open the relevant workflow file, follow the steps, and run the corresponding `/dw-*` command at each step.
