#!/bin/bash
# Installation script for silly-subclaudes Claude Code package

echo "🎭 Installing Silly Subclaudes System..."
echo

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check if Claude Code is installed
if ! command -v claude &> /dev/null; then
    echo -e "${RED}❌ Claude Code CLI not found${NC}"
    echo "Please install Claude Code first: https://github.com/anthropics/claude-code"
    exit 1
fi

echo -e "${GREEN}✓ Claude Code detected${NC}"

# Check required CLI tools
echo
echo "Checking CLI dependencies..."
MISSING_TOOLS=()

for tool in jq gh python3; do
    if command -v $tool &> /dev/null; then
        echo -e "${GREEN}✓ $tool found${NC}"
    else
        echo -e "${RED}✗ $tool not found${NC}"
        MISSING_TOOLS+=($tool)
    fi
done

if [ ${#MISSING_TOOLS[@]} -ne 0 ]; then
    echo
    echo -e "${YELLOW}Missing required tools: ${MISSING_TOOLS[*]}${NC}"
    echo "Please install them before continuing."
    exit 1
fi

# Check for optional tools
echo
echo "Checking optional CLI tools..."
for tool in bat fd rg; do
    if command -v $tool &> /dev/null; then
        echo -e "${GREEN}✓ $tool found${NC}"
    else
        echo -e "${YELLOW}○ $tool not found (optional)${NC}"
    fi
done

# Create necessary directories
echo
echo "Setting up directories..."
mkdir -p ~/Documents/private-vault
echo -e "${GREEN}✓ Created ~/Documents/private-vault${NC}"

# Copy templates
echo
echo "Installing templates..."
cp BLANK_claude-to-do.md ~/Documents/private-vault/
cp DETAILED_claude-to-do.md ~/Documents/private-vault/
echo -e "${GREEN}✓ Templates copied to ~/Documents/private-vault/${NC}"

# Check for CLAUDE.md
echo
if [ -f ~/.claude/CLAUDE.md ]; then
    echo -e "${YELLOW}⚠️  ~/.claude/CLAUDE.md already exists${NC}"
    echo "Please manually merge the contents of ./CLAUDE.md"
    echo "Or append it with: cat CLAUDE.md >> ~/.claude/CLAUDE.md"
else
    mkdir -p ~/.claude
    cp CLAUDE.md ~/.claude/
    echo -e "${GREEN}✓ CLAUDE.md installed${NC}"
fi

# Install MCPs
echo
echo "Installing MCP dependencies..."
echo -e "${YELLOW}Note: MCP installation requires manual steps${NC}"
echo
echo "Required MCP:"
echo "  claude mcp add gemini"
echo
echo "Optional MCPs:"
echo "  claude mcp add github"
echo "  claude mcp add brave-search"
echo "  claude mcp add memory"

# Summary
echo
echo -e "${GREEN}🎉 Installation complete!${NC}"
echo
echo "Next steps:"
echo "1. Install the Gemini MCP (required): claude mcp add gemini"
echo "2. Review and merge CLAUDE.md if needed"
echo "3. Create your first task list in ~/Documents/private-vault/claude-to-do.md"
echo "4. Tell Claude: 'Process claude-to-do.md'"
echo
echo "Happy parallel processing with personality! 🚀"