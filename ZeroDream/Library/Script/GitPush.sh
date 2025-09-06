#!/bin/bash
# Copyright (C) 2000 ZeroDream

# GitPush
# $1 githubRef
# $3 addPath
# $4 message
function gitPush() {
  # Param
  local githubRef=$1
  local addPath="${3:-$GITHUB_WORKSPACE/}"
  local message="${4:-$ZD_DATE}"
  # GitConfig
  git config --global user.name "github-actions[bot]"
  git config --global user.email "github-actions[bot]@users.noreply.github.com"
  # Check if the file has been modified
  git add "$addPath"
  if git diff-index HEAD --quiet --; then
    echo "No changes to commit"
  else
    local commitMessage="ZeroDreamCI [$message]"
    git commit -m "$commitMessage"
    git push origin HEAD:$githubRef
  fi
}
