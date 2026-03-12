# Using This Library

The prompt files in `prompts/` are the source of truth. They are plain markdown, portable across any AI tool.

---

## MCP Server

The fastest way to use this library. The MCP server exposes all 16 prompts as `dw-*` tools over the MCP Streamable HTTP transport. Once connected, any MCP-compatible client — Claude Desktop, OpenCode, ChatGPT — can call prompts directly without copy/paste.

**Server URL:** `https://ai-design-workflow.eric-hexter.workers.dev/mcp`

A GitHub Action regenerates `mcp-server/prompts.json` automatically on every push that touches `prompts/`. Adding a new prompt to the repo makes it available via MCP within ~60 seconds — no manual steps.

### Connect: OpenCode

Add to `opencode.json` in your project, or globally at `~/.config/opencode/opencode.json`:

```json
{
  "$schema": "https://opencode.ai/config.json",
  "mcp": {
    "ai-design-workflow": {
      "type": "remote",
      "url": "https://ai-design-workflow.eric-hexter.workers.dev/mcp",
      "enabled": true
    }
  }
}
```

Restart OpenCode. All `dw-*` tools are now available to the agent automatically.

### Connect: Claude Desktop

Add to `~/Library/Application Support/Claude/claude_desktop_config.json` (macOS) or `%AppData%\Claude\claude_desktop_config.json` (Windows):

```json
{
  "mcpServers": {
    "ai-design-workflow": {
      "url": "https://ai-design-workflow.eric-hexter.workers.dev/mcp"
    }
  }
}
```

Restart Claude Desktop. The `dw-*` tools will appear in the tools panel.

### Connect: ChatGPT (Plus/Team/Enterprise)

ChatGPT connects via a Custom GPT Action using an OpenAPI schema.

1. Go to [chatgpt.com](https://chatgpt.com) → **Explore GPTs** → **Create**
2. Click the **Configure** tab
3. Scroll to **Actions** → **Create new action**
4. In the **Schema** field, paste:

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
6. Click **Save** then **Update**

Once connected, invoke tools by name or describe what you need:

```
Use the dw-define-problem tool: our checkout flow is losing users at the payment step
Use the dw-generate-product-requirements tool with these notes: [paste notes]
Help me turn this rough idea into structured product requirements
```

### Available tools

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

```
GET https://ai-design-workflow.eric-hexter.workers.dev/health
```

Returns `{"status":"ok","server":"ai-design-workflow-mcp"}`.

---

## OpenCode

OpenCode supports two integration options: the **MCP server** (recommended, above) and **local commands**.

### Option 1: MCP server (recommended)

Follow the MCP → Connect: OpenCode instructions above. No local file setup needed.

### Option 2: Local commands (`/dw-*`)

Use this if you prefer self-contained local commands that work without a network connection.

**Install OpenCode:**

```bash
curl -fsSL https://opencode.ai/install | bash
```

Windows (choose one):
```
choco install opencode
scoop install opencode
npm install -g opencode-ai
```

**Install the design workflow commands — one-liner:**

```bash
curl -fsSL https://raw.githubusercontent.com/erichexter/ai-design-workflow/master/opencode/install.sh | bash
```

This script:
1. Creates `~/.config/opencode/commands/` if it does not exist
2. Copies all `dw-*` command files from the repo
3. Creates `~/.config/opencode/skills/` if it does not exist
4. Copies the `dw-requirements-discovery` skill

**Or install manually:**

```bash
# Clone the repo
git clone https://github.com/erichexter/ai-design-workflow.git

# Copy commands (global)
cp -r ai-design-workflow/opencode/commands/* ~/.config/opencode/commands/

# Copy skill (global)
cp -r ai-design-workflow/opencode/skills/dw-requirements-discovery ~/.config/opencode/skills/
```

**Per-project install** (available in one repo only):

```bash
cp -r ai-design-workflow/opencode/commands/* .opencode/commands/
cp -r ai-design-workflow/opencode/skills/dw-requirements-discovery .opencode/skills/
```

**Usage:**

Type `/dw-` in OpenCode to see all available commands:

```
/dw-define-problem our checkout flow is losing users at the payment step
/dw-generate-product-requirements based on the notes above
/dw-generate-user-stories using the requirements we just created
/dw-propose-architecture-options given these requirements
```

**Keeping local commands up to date:**

When a prompt in `prompts/` changes, re-run the install one-liner:

```bash
curl -fsSL https://raw.githubusercontent.com/erichexter/ai-design-workflow/master/opencode/install.sh | bash
```

---

## Claude / ChatGPT (copy/paste)

No setup required. Works in any chat interface.

1. Open the prompt file from `prompts/`
2. Copy the full contents
3. Paste into a new conversation
4. Replace `{{INPUT}}` with your actual input

---

## Workflow Usage

Workflows in `workflows/` are reference documents, not executable commands. Open the relevant workflow file, follow the steps, and run the corresponding tool or command at each step.

---

## MCP Server: Deployment

The server is already deployed. If you fork this repo and want to deploy your own instance:

1. Sign up at [cloudflare.com](https://cloudflare.com) (free)
2. Go to **Workers & Pages** → **Create** → **Import a repository**
3. Select your fork
4. Set **root directory** to `mcp-server/`
5. Set **build command** to `npm install && npm run build`
6. Set **deploy command** to `npx wrangler deploy`

Every subsequent push to `master` auto-deploys. The GitHub Action regenerates `prompts.json` automatically when `prompts/` changes.
