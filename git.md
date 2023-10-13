### Delete all tags

First remote:

```console
$ git tag -l | xargs -n 1 git push --delete origin
```

Then local:

```console
$ git tag | xargs git tag -d
```

### Get current branch

git rev-parse --abbrev-ref HEAD

### Push both commit and tag

git push --atomic origin <branch name> <tag>