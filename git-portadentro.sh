#!/bin/bash

# - Place this file in `~/bin/git-portadentro.sh`
# - Make it executable `chmode +x ~/bin/git-portadentro.sh`
# - `echo 'export PATH="$HOME/bin:$PATH"' >> .zshrc`
# - Add this to `~/.gitconfig`
#   ```
#   [alias]
#     portadentro = !git-portadentro.sh
#   ```


if [ -z "$1" ]; then
  echo "Usage: git portadentro <branch-name>"
  exit 1
fi

CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
git switch "$1" || exit 1
git pull || exit 1
git switch "$CURRENT_BRANCH" || exit 1
git merge "$1"
