# Dynamic Report Retrieval Implementation

## Current Limitation
The Task tool currently returns all output at once after completion, preventing real-time streaming of subclaude progress.

## Proposed Solutions

### Option 1: Progress File Monitoring
Each subclaude writes progress to a file that primary Claude monitors:
```python
# In subclaude prompt
"Write progress updates to /tmp/subclaude_{N}_progress.log"

# Primary Claude monitors
while tasks_running:
    for i in range(num_tasks):
        check_file(f"/tmp/subclaude_{i}_progress.log")
        display_new_lines()
```

### Option 2: Zen MCP Aggregation
When `report_mode: zen-aggregate` is set:
```yaml
# In task config
report_mode: zen-aggregate

# Zen collects and streams reports
"Use zen aggregate-reports to combine subclaude outputs"
```

### Option 3: Partial Task Returns
Modify subclaude prompts to return early status:
```
"First, immediately report 'Starting task X...' then proceed with the full task"
```

## Recommended Approach
Until the Task tool supports streaming, use Option 1 with file monitoring for critical visibility needs. Otherwise, the current batch return is acceptable for most use cases since tasks complete quickly in parallel.

## Future Enhancement
When the Task tool adds streaming support, update the subclaude system to:
1. Stream first few lines of each subclaude's work
2. Show live progress indicators
3. Display completion status as tasks finish