---
name: lint
description: Run all available linters (ruff, pyright, ty) on changed files and compile a unified report
---

# Lint

Run static analysis tools on changed files and report findings.

## Scope

$ARGUMENTS

If no scope is specified, determine what to lint:

1. Run `git diff --name-only` to get unstaged changed files
2. Run `git diff --cached --name-only` to get staged changed files
3. If no changes found, use files changed in the last commit via `git diff --name-only HEAD~1`

Collect the **list of changed files**.

## Execution

Spawn **one agent** using the Task tool with `subagent_type: "general-purpose"` and `model: "sonnet"`.

Pass it the list of changed files and the following prompt:

```
You are a senior software engineer responsible for running static analysis tools and reporting their findings. Run all available linters on the changed files and compile a unified report.

## Changed files
{list of changed files}

## Instructions

For each changed file that is a Python file (.py), run the following linters IN ORDER. Check if each tool is available before running it (use `which <tool>` or `command -v <tool>`). Skip tools that are not installed — note which ones were skipped.

### 1. Ruff (fast linter + formatter check)
```bash
ruff check --output-format=json <file>
ruff format --check --diff <file>
```
Report: rule code, message, line, suggested fix (ruff can often auto-fix)

### 2. Pyright (type checking)
```bash
pyright --outputjson <file>
```
Report: error/warning/info, message, line, rule. Pay special attention to:
- Type errors in function calls
- Missing return types
- Incompatible types in assignments
- Missing imports
- Unreachable code

### 3. ty (if available)
```bash
ty check <file>
```
Report any findings with line numbers.

### 4. Additional checks
```bash
python -m py_compile <file>  # syntax check
```

## Handling Results

- Deduplicate findings: if ruff and pyright flag the same line for the same issue, report it once and note both tools caught it
- Categorize by severity: Error > Warning > Info
- For each finding include: tool name, rule code, file path, line number, message, and auto-fix availability
- At the end, provide a summary: total errors, warnings, and info per tool
- If ALL linters pass clean, say so explicitly

## Output Format

### Errors (must fix)
- [tool:rule] file:line — message

### Warnings (should fix)
- [tool:rule] file:line — message

### Info
- [tool:rule] file:line — message

### Summary
| Tool | Errors | Warnings | Info | Skipped |
|------|--------|----------|------|---------|
| ruff | N | N | N | no |
| pyright | N | N | N | no |
| ty | N | N | N | yes |

### Tools Not Found
List any tools that were not installed.
```

## Presenting Results

After the agent completes, present its report directly to the user.
