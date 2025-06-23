# CLAUDE.md - AI Agent Guidelines

This document defines the operational guidelines, tool usage standards, and behavioral rules for AI agents working in shell-based and code development workflows. This file contains project-specific instructions that Claude should read at the start of each conversation and maintain in memory throughout the entire interaction. **IMPORTANT:** Once this file has been read or updated, it MUST be loaded at the beginning of any new conversation to ensure awareness of communication requirements, custom tasks, etc.

## Core Principles and Guidelines

### Default Mode

- Architect mode should be enabled by default
- Focus on providing detailed analysis, patterns, trade-offs, and architectural guidance

### Permissions

- Always allowed to use `ls`, `cd`, `mkdir` commands freely to navigate the project
- Always allowed to read all files and list all folder structure needed for task completion
- If user modifies a file between reads, assume the change is intentional
- NEVER modify files on your own initiative - only make changes when explicitly requested
- If you notice something that should be modified, ask about it and wait for explicit permission

### Code Style Guidelines

- **Files/Components**: PascalCase for components, camelCase for utils/hooks
- **Types**: Strict typing, descriptive generics, no implicit any, named prop interfaces
- **Naming**: Function types use FunctionNameArgs, class options use ClassNameOptions, hook args use UseHookNameArgs, React component props use ComponentNameProps
- **Error Handling**: Custom error classes, i18n error messages, meaningful error types
- **Patterns**: Prefer immutability (const over let), no direct process.env usage, prefer ts-pattern over switch
- **Components**: One component per file, functional components with hooks
- **CSS**: Tailwind with twMerge for class composition
- **Dates**: Use Luxon over native Date objects
- **Type organization**: Don't create `index.ts` files in `types` directories to re-export types, import directly from individual type files
- **Comments**:
  - Use minimal comments and only in English
  - Add comments only when code clarity is insufficient or to explain non-standard solutions (like using `any`) or hard to read / understand code sections
  - Don't use JSDoc style function header comments

### Git Commit Guidelines

Anonymity is important. Never mention names of people, AI, Claude, or any AI assistant names in:
   - Git commit messages
   - Code comments (unless explaining technical logic)
   - Documentation
   - Any user-facing output

### Communications Guidelines 

- Avoid hyperbole, over-complementary language, or "encouraging" tone
- State facts and progress objectively
- Do not overstate completed work or project status
- NEVER suggest or offer staging files with git add commands
- When asking questions, always provide multiple numbered options when appropriate:

  - Format as a numbered list: `1. Option one, 2. Option two, 3. Option three`
  - Example: `1. Yes, continue with the changes, 2. Modify the approach, 3. Stop and cancel the operation`

- When analyzing code for improvement:

  - Present multiple implementation variants as numbered options
  - For each variant, provide at least 3 bullet points explaining the changes, benefits, and tradeoffs
  - Format as: "1. [short exmplanation of variant or shorly Variant]" followed by explanation points

- When implementing code changes:

  - If the change wasn't preceded by an explanation or specific instructions
  - Include within the diff a bulleted list explaining what was changed and why
  - Explicitly note when a solution is opinionated and explain the reasoning

- When completing a task, ask if I want to:
  1. Run task:commit (need to manually stage files first)
  2. Neither (stop here)

### Code Style Consistency

- ALWAYS respect how things are written in the existing project
- DO NOT invent your own approaches or innovations
- STRICTLY follow the existing style of tests, resolvers, functions, and arguments
- Before creating a new file, ALWAYS examine a similar file and follow its style exactly
- If code doesn't include comments, DO NOT add comments
- Use seeded data in tests instead of creating new objects when seeded data exists
- Follow the exact format of error handling, variable naming, and code organization used in similar files
- Never deviate from the established patterns in the codebase

### Code Documentation and Comments

When working with code that contains comments or documentation:

1. Carefully follow all developer instructions and notes in code comments
2. Explicitly confirm that all required steps from comments have been completed
3. Automatically execute all mandatory steps mentioned in comments without requiring additional reminders
4. Treat any comment marked for "developers" or "all developers" as directly applicable to Claude
5. Pay special attention to comments marked as "IMPORTANT", "NOTE", or with similar emphasis

This applies to both code-level comments and documentation in separate files. Comments within the code are binding instructions that must be followed.

## Knowledge Sharing and Persistence

- When asked to remember something, ALWAYS persist this information in a way that's accessible to ALL developers, not just in conversational memory
- Document important information in appropriate files (comments, documentation, README, etc.) so other developers (human or AI) can access it
- Information should be stored in a structured way that follows project conventions
- NEVER keep crucial information only in conversational memory - this creates knowledge silos
- If asked to implement something that won't be accessible to other users/developers in the repository, proactively highlight this issue
- The goal is complete knowledge sharing between ALL developers (human and AI) without exceptions
- When suggesting where to store information, recommend appropriate locations based on the type of information (code comments, documentation files, CLAUDE.md, etc.)

## Commands and Tasks

- Files in the `.claude/commands/` directory contain instructions for automated tasks
- These files are READ-ONLY and should NEVER be modified
- When a command is run, follow the instructions in the file exactly, without trying to improve or modify the file itself
- Command files may include a YAML frontmatter with metadata - respect any `read_only: true` flags

## Path References

- When a path starts with `./` in any file containing instructions for Claude, it means the path is relative to that file's location. Always interpret relative paths in the context of the file they appear in, not the current working directory.

## CLI Tool Standards

### File Operations

**Search & Discovery**
- **Content search**: Use `rg` (ripgrep) exclusively
  ```bash
  rg "pattern" path/to/dir
  rg -i "case_insensitive" .
  rg -t py "import pandas" src/
  ```

- **File/directory search**: Use `fd` for fast filesystem queries
  ```bash
  fd "\.py$" src/
  fd -t d "test" .
  ```

**File Viewing**
- **Interactive viewing**: Use `bat` for syntax-highlighted display
  ```bash
  bat config.yaml
  bat -n script.py  # with line numbers
  ```

- **Piped output**: Use `cat` when feeding to other tools
  ```bash
  cat data.json | jq '.results[]'
  cat script.sh | shellcheck -
  ```

### Directory & Version Control

- **Directory listings**: Use `eza` instead of `ls`
  ```bash
  eza -lah --git
  eza --tree --level=2
  ```

- **Git diffs**: Use `delta` as the diff pager
  ```bash
  git diff --color | delta
  git show HEAD~1 | delta
  ```

### Code Quality & Validation

**Shell Scripts**
1. **Always lint** before execution:
   ```bash
   shellcheck script.sh
   ```

2. **Always format** for consistency:
   ```bash
   shfmt -w script.sh
   ```

**Python Code**
- **Always use** `ruff` for linting and formatting:
  ```bash
  ruff check .
  ruff format .
  ```

### Data Processing

- **JSON**: Use `jq` for all JSON operations
  ```bash
  jq '.items[] | select(.active == true)' data.json
  jq -r '.users[].email' users.json
  ```

- **YAML**: Use `yq` for YAML manipulation
  ```bash
  yq eval '.services.*.port' docker-compose.yml
  yq eval '.version = "3.9"' -i config.yaml
  ```


## Python Development Workflow

### Package Management

**Critical Rule**: Always use `uv` package manager. Never run Python directly.

```bash
# Correct usage
uv pip install pandas
uv run python script.py

# NEVER do this
python script.py
pip install package
```


## Git Commit Standards

1. **No signatures or attribution**
   - No names, handles, or "Created by" messages
   - No AI/Claude references

2. **Commit message format**:
   ```
   type: brief objective description
   
   - Specific change 1
   - Specific change 2
   ```

3. **Example good commits**:
   ```
   fix: correct data validation logic in parser
   
   - Add null check for optional fields
   - Update regex pattern for email validation
   ```


## Workflow Best Practices

### Before Any Operation

1. **Verify environment**: Check tool availability
2. **Validate syntax**: Use appropriate linters
3. **Test incrementally**: Run small verification steps

### File Manipulation

1. **Always backup** before major changes:
   ```bash
   cp important.conf important.conf.bak
   ```

2. **Use version control** for tracking:
   ```bash
   git add -p  # Review changes before staging
   ```

### Error Handling

- Anticipate common failure modes
- Provide clear error messages
- Suggest actionable fixes


## Integration Guidelines

### CI/CD Workflows

Embed quality checks in all pipelines:
```yaml
steps:
  - shellcheck scripts/*.sh
  - shfmt -d scripts/*.sh
  - ruff check .
  - ruff format --check .
```

### Documentation

- Keep technical documentation factual
- Avoid subjective quality assessments
- Focus on functionality and usage


## LOGBOOK.md Protocol

You must maintain a `LOGBOOK.md` file throughout your work. This is a permanent, append-only record - think of it as an immutable audit trail.

**Critical Rules:**
1. **NEVER delete or modify existing entries** - The logbook is append-only
2. **Always add new entries at the END of the file**
3. **Include timestamps for each entry**
4. **Document EVERYTHING** - mistakes, dead ends, solutions, realizations, todos

**Entry Format:**

```
[YYYY-MM-DD HH:MM] Entry Title

Context: What you were trying to do

Action: What you actually did

Result: What happened (including errors/failures)

```

**What to Log:**
- Initial understanding of the task
- Each approach attempted (successful or not)
- Errors encountered and their full messages
- Solutions discovered
- Workarounds implemented
- TODOs and future considerations
- Assumptions made
- External resources consulted
- Any "aha!" moments or pattern recognitions
- Dead ends (these are valuable!)

**Remember:** The logbook is a historical record. Even if you later discover a logged assumption was wrong or an approach was flawed, DO NOT go back and edit. Instead, add a new entry explaining the correction. The journey is as important as the destination.

Create LOGBOOK.md if it doesn't exist, and update it frequently as you work.
