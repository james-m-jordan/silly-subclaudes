# Claude To-Do List - Detailed Configuration

## Global Settings

```yaml
execution_mode: parallel  # parallel | sequential | smart-batch
enable_qa_round: true     # true | false | smart (only for complex tasks)
report_mode: dynamic      # dynamic | manual | zen-aggregate
max_parallel_agents: 5    # limit concurrent agents
zen_routing: auto         # auto | manual | disabled
```

## Task Definitions

### Task 1
**Title**: [Brief task description]
```yaml
complexity: medium        # low | medium | high | extreme
effort: 30m              # estimated time: 5m, 30m, 2h, 1d
model: auto              # auto | zen-gemini | zen-o3 | zen-flash | claude
needs_qa: true           # true | false | auto
depends_on: []           # list of task numbers this depends on
resources: normal        # low | normal | high (CPU/memory needs)
tags: [security, api]    # optional tags for categorization
```
**Description**: 
[Detailed task description goes here. Be specific about requirements, 
expected outputs, and any special considerations.]

---

### Task 2
**Title**: [Brief task description]
```yaml
complexity: high
effort: 2h
model: zen-gemini        # use for large context
needs_qa: true
depends_on: [1]          # waits for task 1 to complete
resources: high
tags: [analysis, data]
```
**Description**:
[Detailed description]

---

### Task 3
**Title**: [Brief task description]
```yaml
complexity: low
effort: 5m
model: zen-flash         # fast iteration
needs_qa: false          # skip QA for simple task
depends_on: []
resources: low
tags: [utility]
```
**Description**:
[Detailed description]

---

## Model Selection Guide

| Model | Best For | Context Window | Speed |
|-------|----------|----------------|-------|
| `auto` | Let Zen decide based on task | Varies | Varies |
| `zen-gemini` | Large files, complex analysis | 1M tokens | Medium |
| `zen-o3` | Complex reasoning, debugging | Large | Slow |
| `zen-flash` | Quick tasks, simple operations | Medium | Fast |
| `claude` | Default, general purpose | Standard | Medium |

## Complexity Guidelines

- **Low**: Single-file edits, simple searches, basic operations
- **Medium**: Multi-file coordination, API integration, moderate logic
- **High**: Architecture design, complex debugging, multi-system integration  
- **Extreme**: Full application rewrites, complex algorithms, research tasks

## Advanced Options

### Batch Configuration
```yaml
batch_1:
  tasks: [1, 2, 3]
  max_parallel: 3
  shared_context: true

batch_2:
  tasks: [4, 5]
  max_parallel: 2
  depends_on_batch: 1
```

### QA Configuration
```yaml
qa_config:
  mode: targeted          # all | targeted | critical-only
  validators: 
    - security-review     # for tasks tagged 'security'
    - performance-check   # for high-resource tasks
    - integration-test    # for API/system tasks
```

## Notes
- Tasks execute based on dependencies and resource availability
- Zen MCP will route to optimal models when `model: auto`
- Set `needs_qa: false` for trivial tasks to save resources
- Use tags to trigger specialized QA validators
- Batch related tasks for shared context efficiency