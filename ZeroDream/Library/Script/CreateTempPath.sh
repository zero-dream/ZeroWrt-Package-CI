#!/bin/bash
# Copyright (C) 2000 ZeroDream

# CreateTempPath
# $1 dirName
function createTempPath() {
  # Param
  local dirName=$1
  # CreateTempPath
  local uuid=$(uuidgen | tr -d '-')
  tempPath="$ZD_TempPath/$dirName-$uuid"
  mkdir -p "$tempPath"
  echo "$tempPath"
}
