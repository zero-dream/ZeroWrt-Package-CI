#!/bin/bash
# Copyright (C) 2000 ZeroDream

# --------------------------------------------------

# Usage:
# mergeArr=('owner/one' 'owner/two' 'owner/three')
# mergeRepo 'mergeArr'

# MergeRepo
# $1 mergeArr
function mergeRepo() {
  # Param
  local -n mergeArr=$1
  # MergeRepo
  local repoPath="$RUNNER_TEMP/ZeroDreamRepo-$(uuidgen | tr -d '-')"
  for repository in "${mergeArr[@]}"; do
    repoName=$(echo -n "$repository" | md5sum | awk '{print $1}')
    # GitClone
    git clone --depth=1 https://github.com/$repository.git "$repoPath/$repoName/" || exit 1 # Exit
    # DeleteGitDir
    rm -rf "$repoPath/$repoName/.git/"
    # MergeRepo
    cp -a "$GITHUB_WORKSPACE/." "$repoPath/$repoName/"
    find "$GITHUB_WORKSPACE/" -mindepth 1 -delete
    cp -a "$repoPath/$repoName/." "$GITHUB_WORKSPACE/"
    # DeleteRepo
    rm -rf "$repoPath/$repoName/"
  done
}
