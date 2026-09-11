# Repository Guidelines

## Commits

Use Conventional Commits: `<type>(<scope>): <summary>`.
- Types: `feat`, `fix`, `refactor`, `chore`, `docs`, `test`.
- Scope: package name when applicable; otherwise omit.
- Keep each commit focused and write the summary in imperative English.

## Security & Configuration

Never commit credentials, tokens, machine-specific paths, or private settings. Treat `.secrets` as local-only.

Review changes to bootstrap scripts and the `Makefile` especially carefully because they can change a contributor's shell environment or symlinked files.
