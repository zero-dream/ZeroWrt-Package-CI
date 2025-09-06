#!/bin/bash
# Copyright (C) 2000 ZeroDream

# About $scriptPath.hook
# exit 0 # CurrentStep: continue; BehindStep continue
# exit 1 # CurrentStep: stop; BehindStep continue
# exit 2 # CurrentStep: stop; BehindStep stop

# Hook
# $1 scriptPath
function hook() {
  # Param
  local scriptPath=$1
  # Hook
  echo '--------------------------------------------------'
  bash "$ZD_HookPathSet/$scriptPath.hook"
  local state=$?
  echo "Hook: $ZD_HookPathSet/$scriptPath.hook"
  echo "State: $state"
  echo '--------------------------------------------------'
  (($state == 1)) && exit 0
  (($state == 2)) && exit 1
  # Must, otherwise the status code will be that of the previous command
  return 0
}
