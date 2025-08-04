# Silly Subclaudes 🎭

A parallel task execution system for Claude Code that spawns multiple "subclaude" agents with unique personalities to handle tasks concurrently.

## Overview

This system transforms Claude from a sequential processor into a parallel execution engine. Each subclaude gets:
- A silly name (e.g., "Captain Codewhisper", "Professor Loopmaster")
- A unique backstory that influences their reporting style
- Full access to Claude's tools and capabilities
- The ability to work independently while reporting back to the primary orchestrator

## Features

- **Parallel Execution**: All tasks run simultaneously for maximum efficiency
- **Personality System**: Each agent has a unique personality that shows in their work
- **Two-Round System**: Optional QA agents review the work of the first round
- **Zen MCP Integration**: Smart model routing based on task complexity
- **Hash-Based Tracking**: All executions are tracked with unique hashes
- **Dynamic Reporting**: Real-time progress updates (when implemented)

## Quick Start

1. Copy the subclaude system additions to your `~/.claude/CLAUDE.md`
2. Create a task list using one of the templates:
   - `BLANK_claude-to-do.md` - Simple task list
   - `DETAILED_claude-to-do.md` - With metadata and routing options
3. Save your task list to `~/Documents/private-vault/claude-to-do.md`
4. Tell Claude: "Process claude-to-do.md"
5. Watch the subclaudes work in parallel!

## Templates

### Simple Template (BLANK_claude-to-do.md)
```markdown
# Claude To-Do List

## Tasks

1. [Task 1 description]
2. [Task 2 description]
3. [Task 3 description]
```

### Detailed Template (DETAILED_claude-to-do.md)
```yaml
complexity: medium        # low | medium | high | extreme
effort: 30m              # 5m, 30m, 2h, 1d
model: auto              # auto | zen-gemini | zen-o3 | zen-flash | claude
needs_qa: true           # true | false | auto
```

## Personality System

Subclaudes are randomly assigned names from:
- **First names**: Captain, Professor, Agent, Detective, Admiral, Baron, etc.
- **Last names**: Codewhisper, Bytecruncher, Loopmaster, Debugsmith, etc.

Each gets a two-sentence backstory that creates their unique perspective.

## QA Round

QA agents have their own personality pool:
- Inspector Bugfinder - "Famous for finding a bug in 'Hello World'"
- Auditor Edgecase - "Once made a compiler cry with their test cases"
- Validator Nullcheck - "Believes no code is complete without at least one TODO"

## File Structure

```
~/Documents/private-vault/
├── claude-to-do.md                          # Your active task list
├── BLANK_claude-to-do.md                    # Simple template
├── DETAILED_claude-to-do.md                 # Advanced template
├── subclaude_report_[HASH].md              # Generated reports
└── COMPLETED_[DATE]_[HASH]_claude-to-do.md # Archived task lists
```

## Model Routing with Zen MCP

When Zen MCP is available, tasks can be routed to optimal models:

| Task Type | Routed To | Why |
|-----------|-----------|-----|
| Large files/context | zen-gemini | 1M token context window |
| Complex debugging | zen-o3 | Superior reasoning |
| Quick tasks | zen-flash | Fast iteration |
| General purpose | claude | Default balanced performance |

## Example Output

```markdown
## Task 1: Count .md files
**Agent**: Captain Codewhisper  
*"Once won a hackathon by coding entirely in haikus. Now spends weekends teaching assembly language to houseplants."*

**Status**: ✓ Completed

Captain Codewhisper brought their poetic sensibilities to the task...
```

## Advanced Usage

### Dependencies
```yaml
Task 2:
  depends_on: [1]  # Waits for task 1 to complete
```

### Resource Limits
```yaml
max_parallel_agents: 5  # Prevent resource exhaustion
```

### Batch Configuration
```yaml
batch_1:
  tasks: [1, 2, 3]
  shared_context: true
```

## Architecture Notes

### Strengths
- Simple to use - just write a todo list
- True parallel execution
- Entertaining and engaging reports
- Excellent audit trail

### Limitations
- No built-in retry logic
- Can't express complex dependencies
- Each subclaude loads full context
- Manual report aggregation

### Future Improvements
- Streaming progress updates
- Automatic report aggregation
- Smart batching for large task lists
- Inter-subclaude communication

## Contributing

This is an experimental system. Feel free to:
- Add more personality combinations
- Enhance the QA system
- Improve task routing logic
- Add new report formats

## License

Part of the Claude Code ecosystem - use freely and enhance creatively!

---
*Remember: The real treasure is the merge conflicts we made along the way* 🚀