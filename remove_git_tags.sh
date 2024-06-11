#!/bin/bash

tags=$(git tag -l "2.3.26*")

if [ -z "$tags" ]; then
  echo "No tags found matching the pattern."
  exit 0
fi

for tag in $tags; do
  git tag -d "$tag"
done

for tag in $tags; do
  git push origin --delete "$tag"
done
