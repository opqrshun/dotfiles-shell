# dotfiles-shell

Shell dotfiles installer.

## Requirements

Install required commands before running:

- `bash`
- `git`
- `curl`
- `find`, `ln`, `mv`, `mkdir`

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/ttaki/dotfiles-shell/master/sample/setup.sh | bash
```

or

```bash
git clone https://github.com/ttaki/dotfiles-shell "$HOME/.dotfiles-shell"
bash "$HOME/.dotfiles-shell/install.sh"
```

## Conflict Policy

When a target already exists, installer backs it up and then links dotfiles.

Backup format:

- `<target>.bak.<YYYYmmddHHMMSS>`

If the target is already linked to the same source, installer skips it.

## Troubleshooting

- `Required command not found`: install the command and rerun.
- Network clone failure (`git clone`): verify internet access and rerun.
