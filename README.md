# gpush – Push Git Repos to Multiple Remotes and Branches Interactively

`gpush` is a lightweight CLI tool to push the current Git repository to **multiple remotes and/or branches interactively**. Ideal for developers working with mirrored repositories, forked origins, backup remotes, or complex Git workflows.

> Built for macOS and Homebrew, tested on Apple Silicon and Intel architectures.

---

## Features

- Interactive selection of remotes (origin, backup, etc.)
- Interactive selection of remote branches
- Pushes current branch to selected targets
- Supports both `main`, `master`, and custom branches
- Works with GitHub, GitLab, Bitbucket, and private Git servers
- Clean terminal-based UI for fast decision making
- No dependencies: pure Bash and Git

---

## Installation

```bash
brew tap ThomasDanilo96/gpush
brew install gpush
```

## Quick Start

```bash
# Step 1: Tap and install
brew tap ThomasDanilo96/gpush
brew install gpush

# Step 2: Use it
cd your-repo/
gpush
```
You're done.

---

## How It Works

`gpush` detects your remotes and the current branch, then:

- Lists all available git remote targets

- Asks which ones you want to push to

- Lets you pick the remote branch (same or different)

- Executes:

```
git push <remote> <local_branch>:<remote_branch>
```
Example output:

```
✔ Selected remotes: origin, backup
✔ Current branch: feature/new-ui
✔ Remote branches: feature/new-ui
✔ Pushing...
```

---

## SEO Keywords
- git push multiple remotes

- git push all remotes one command

- git push to mirror repo

- git push to origin and backup

-interactive git push CLI tool

- homebrew git push tool macOS

- git CLI automation multiple remotes

- how to push to multiple branches at once

- manage git remotes and branches CLI mac

---

## Requirements

- macOS (Intel or Apple Silicon)

- Homebrew installed

- Git repository with at least one remote

- `bash` and `git` in your `$PATH`

---

## Safe by Design

- Never deletes or overwrites branches

- Never pushes forcefully (--force not used)

- Only pushes to explicitly selected targets

- Idempotent: you can re-run it safely

---

## Use Cases

| Use Case                         | gpush Solves It |
| -------------------------------- | --------------- |
| Push to `origin` and `backup`    | ✅               |
| Push to custom `dev-remote`      | ✅               |
| Select remote branch dynamically | ✅               |
| Use in CI or post-commit hook    | ✅               |

---

## Resources

- [Git Documentation](https://git-scm.com/doc)

- [Homebrew](https://brew.sh/)

- [GitHub CLI Tools](https://cli.github.com/)

---

## License
MIT – use it freely, improve it, share it.

---

## Author
[Danilo D’Antoni](https://www.danilodantoni.it/)

GitHub → [@ThomasDanilo96](https://github.com/ThomasDanilo96)

---

## Contribute
Pull requests welcome! Open an issue or PR if you’ve got an idea or fix.