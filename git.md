### Delete all tags

First remote:

```console
$ git tag -l | xargs -n 1 git push --delete origin
```

Then local:

```console
$ git tag | xargs git tag -d
```
