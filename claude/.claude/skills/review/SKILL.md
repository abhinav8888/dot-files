---
name: review
description: Run a comprehensive code review covering quality, security, and performance
context: fork
agent: code-reviewer
---

# Code Review

Review the following code changes for quality, security, and performance issues.

## Scope

$ARGUMENTS

If no scope is specified, review all staged and unstaged changes:

1. Run `git diff` to get unstaged changes
2. Run `git diff --cached` to get staged changes
3. If no changes found, review files changed in the last commit via `git diff HEAD~1`

## Instructions

- Read each changed file fully before reviewing
- Focus on actual issues, not style nitpicks
- Group findings by severity: Critical > Warning > Info
- For each finding, include the file path and line number
- Suggest a fix for Critical and Warning items
- Keep the report concise — skip categories with no issues
