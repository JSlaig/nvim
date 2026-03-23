# AGENTS.md

This file contains guidelines for AI agents working on this Neovim configuration repository.

## 1. Build / Lint / Test Commands

### Linting
This configuration uses `nvim-lint` for linting.
- **Automatic**: Linting runs on `BufEnter`, `BufWritePost`, and `InsertLeave`.
- **Manual**: Run `:lua require("lint").try_lint()` to lint the current buffer.
- **Supported Linters**:
  - Lua: `selene`
  - JavaScript/HTML/CSS/JSON: `eslint_d`
  - SCSS: `stylelint`
- **Installation**: Linters are managed by `mason-nvim-lint`. Run `:Mason` to install missing linters.

### Formatting
This configuration mentions `conform.nvim` in the README but does not currently have it configured in the plugin files.
- **Lua**: Use `stylua` (standard for Neovim configs).
- **JavaScript/TypeScript**: Use `prettier` or `eslint_d --fix`.
- **Manual Format**: If `conform.nvim` is installed, use `:ConformInfo` and `:Format`.

### Testing
There is no explicit test runner (e.g., `plenary.nvim` test suite) configured in this Neovim config.
- **Project Tasks**: Use the `vs-tasks` plugin to run commands defined in `.vscode/tasks.json`.
  - Open task menu: `<leader>bt`
  - Run single task: Select task from the menu.
- **Shell Commands**: Use the integrated terminal (`Ctrl + \`) to run test commands manually (e.g., `npm test`, `pytest`, `go test`).

### Running a Single Test
If you have a specific test command in `tasks.json`:
1. Open the task menu with `<leader>bt`.
2. Select the specific test task.
Alternatively, run the test command directly in the terminal:
```bash
# Example for JS
npm test -- --testPathPattern="MyComponent"
```

## 2. Code Style Guidelines

### Indentation
- **Lua**: 4 spaces (configured in `lua/jslaig/core/set.lua`).
- **Keymaps**: 2 spaces (in `lua/jslaig/core/keymaps.lua` - follow existing style in that file).
- **General**: Use 4 spaces for consistency unless modifying existing 2-space files.

### Imports

- **Lua**: Use `require("module")`.
  - Example: `local lint = require("lint")`
- **Plugin Specs**: Use `lazy.nvim` syntax.
  - Example: `{ "user/repo", config = function() ... end }`

### Naming Conventions
- **Lua**: `snake_case` for variables, functions, and modules.
- **Constants**: `UPPER_SNAKE_CASE`.
- **Plugin Specs**: `kebab-case` for GitHub usernames/repo names.

### Error Handling
- **Lua**: Use `pcall` or `xpcall` for protected calls.
- **Plugin Setup**: Wrap setup logic in `config = function() ... end` to handle errors gracefully.

### Tables and Mixed Tables
- **Lazy.nvim**: Plugin specs in `lazy.nvim` can appear as "mixed tables" (e.g., `{ "plugin", config = ... }`).
- **Selene Warning**: The linter may flag "mixed tables" as a warning. This is expected for `lazy.nvim` plugin specs and can be ignored or suppressed via `selene.toml` if needed.

### File Structure
- **Core**: `lua/jslaig/core/` (keymaps, settings).
- **Plugins**: `lua/jslaig/plugins/` (categorized by appearance, navigation, tools, ide).
- **Init**: `init.lua` loads core and lazy.

## 3. Existing Configuration Notes

- **Shell**: PowerShell 7 (`pwsh`) is configured as the default shell in `set.lua`.
- **Leader Key**: Space (` `).
- **Dependencies**:
  - `fd` and `ripgrep` are required for Telescope (see README).
  - `mason.nvim` manages LSP, linters, and formatters.
- **Diagnostics**: The user reported "mixed tables" warnings in `opencode.lua`. This is a false positive for `lazy.nvim` syntax.

## 4. Agent Workflow

1.  **Read Files**: Always read relevant files (e.g., `lazy.lua`, plugin specs) before making changes.
2.  **Follow Conventions**: Mimic existing code style (indentation, naming).
3.  **Lint/Format**: Run linting after changes (`:lua require("lint").try_lint()`).
4.  **Test**: Verify changes by running relevant tasks or commands.
5.  **Commit**: Only commit when explicitly asked. Use conventional commit messages.

## 5. Troubleshooting

- **Linter Not Working**: Run `:Mason` to ensure linters are installed.
- **Formatting Not Working**: Check if `conform.nvim` is properly configured (currently missing).
- **Task Runner**: Ensure `.vscode/tasks.json` exists for `vs-tasks` to work.
