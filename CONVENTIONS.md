# Claude Code Package Conventions

This appears to be a new pattern emerging for Claude Code extensions/systems. Here's what we're establishing:

## Package Structure

```
claude-code-package/
├── claude-code.manifest.json    # Package metadata & dependencies
├── mcp-requirements.yml         # MCP server requirements
├── CLAUDE.md                    # System prompt additions
├── CONVENTIONS.md              # This file - explaining the pattern
├── README.md                   # User documentation
├── templates/                  # User-facing templates
│   ├── *.md
│   └── *.yml
├── examples/                   # Example outputs/usage
│   └── *.md
└── scripts/                    # Helper scripts if needed
    └── install.sh
```

## Key Files

### claude-code.manifest.json
Central manifest file containing:
- Package metadata (name, version, description)
- MCP dependencies (required/optional)
- CLI tool dependencies
- Subagent definitions
- Feature flags
- Installation instructions
- Usage patterns

### mcp-requirements.yml
Human-readable MCP requirements:
- Required vs optional MCPs
- Version constraints
- Configuration requirements
- Purpose/description for each

### CLAUDE.md
System prompt additions that need to be merged into user's `~/.claude/CLAUDE.md`

## Naming Convention
- Package type: `claude-code-extension`
- Repository pattern: `{feature}-{descriptor}` (e.g., `silly-subclaudes`)
- Manifest: Always `claude-code.manifest.json`

## Installation Pattern
1. Clone/download the repository
2. Check `claude-code.manifest.json` for requirements
3. Install MCPs: `claude mcp add {mcp-name}`
4. Merge CLAUDE.md content
5. Copy templates to working directory
6. Verify CLI tools are available

## Benefits
- **Discoverable**: Clear dependencies and requirements
- **Portable**: Everything needed in one repo
- **Versioned**: Can track compatibility
- **Composable**: Multiple packages can coexist
- **Standard**: Consistent structure across packages

## Future Possibilities
- Package manager: `claude-pkg install silly-subclaudes`
- Registry: Central repository of Claude Code packages
- Dependency resolution: Automatic MCP installation
- Conflict detection: Check for CLAUDE.md conflicts
- Version management: Handle updates gracefully

## Similar Patterns
This is similar to:
- Python's `requirements.txt` + `setup.py`
- Node's `package.json`
- Rust's `Cargo.toml`
- Docker's `Dockerfile` + `docker-compose.yml`

But specifically tailored for Claude Code's unique needs:
- System prompt engineering
- MCP orchestration
- Subagent definitions
- Template management

---
*We might be starting a new trend here - Claude Code packages that bundle prompts, agents, MCPs, and templates into shareable, installable units!*