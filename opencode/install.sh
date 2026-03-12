#!/usr/bin/env bash
# AI Design Workflow — OpenCode installer
# Installs dw-* commands and skills into ~/.config/opencode/
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/erichexter/ai-design-workflow/master/opencode/install.sh | bash

set -e

REPO="erichexter/ai-design-workflow"
BRANCH="master"
RAW_BASE="https://raw.githubusercontent.com/${REPO}/${BRANCH}/opencode"
COMMANDS_DIR="${HOME}/.config/opencode/commands"
SKILLS_DIR="${HOME}/.config/opencode/skills"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo ""
echo -e "${BLUE}AI Design Workflow — OpenCode installer${NC}"
echo "Installing dw-* commands and skills to ~/.config/opencode/"
echo ""

# --- Commands ---

mkdir -p "${COMMANDS_DIR}"

COMMANDS=(
  "dw-define-problem.md"
  "dw-clarify-feature-idea.md"
  "dw-identify-user-personas.md"
  "dw-conduct-requirements-discovery.md"
  "dw-extract-requirements-from-notes.md"
  "dw-generate-product-requirements.md"
  "dw-generate-user-stories.md"
  "dw-generate-acceptance-criteria.md"
  "dw-propose-architecture-options.md"
  "dw-review-architecture-design.md"
  "dw-generate-api-spec.md"
  "dw-generate-implementation-plan.md"
  "dw-identify-technical-risks.md"
  "dw-identify-edge-cases.md"
  "dw-evaluate-architecture-tradeoffs.md"
  "dw-summarize-meeting-notes.md"
)

echo "Installing commands..."
for cmd in "${COMMANDS[@]}"; do
  curl -fsSL "${RAW_BASE}/commands/${cmd}" -o "${COMMANDS_DIR}/${cmd}"
  echo -e "  ${GREEN}✓${NC} ${cmd}"
done

# --- Skills ---

SKILL_DIR="${SKILLS_DIR}/dw-requirements-discovery"
mkdir -p "${SKILL_DIR}"

echo ""
echo "Installing skills..."
curl -fsSL "${RAW_BASE}/skills/dw-requirements-discovery/SKILL.md" -o "${SKILL_DIR}/SKILL.md"
echo -e "  ${GREEN}✓${NC} dw-requirements-discovery"

# --- MCP config hint ---

echo ""
echo -e "${GREEN}Done.${NC} ${#COMMANDS[@]} commands and 1 skill installed."
echo ""
echo "To also connect the MCP server, add this to your opencode.json:"
echo ""
echo '  {'
echo '    "$schema": "https://opencode.ai/config.json",'
echo '    "mcp": {'
echo '      "ai-design-workflow": {'
echo '        "type": "remote",'
echo '        "url": "https://ai-design-workflow.eric-hexter.workers.dev/mcp",'
echo '        "enabled": true'
echo '      }'
echo '    }'
echo '  }'
echo ""
echo "Type /dw- in OpenCode to see all available commands."
echo ""
