# Repository Guidelines

## Commit & Pull Request Guidelines

Use Conventional Commits: `<type>(<scope>): <imperative summary>`.

```text
fix(zsh): quote PATH assembly
chore: update Homebrew bundle
```

Allowed types are `feat`, `fix`, `refactor`, `chore`, `docs`, and `test`. Use a package scope such as `zsh` or `tmux` when applicable; otherwise omit it. Keep each commit focused and use an imperative English summary.

## Security & Configuration

Never commit credentials, tokens, machine-specific paths, or private settings. Treat `.secrets` as local-only. Review changes to bootstrap scripts and the `Makefile` especially carefully because they can change a contributor's shell environment or symlinked files.
