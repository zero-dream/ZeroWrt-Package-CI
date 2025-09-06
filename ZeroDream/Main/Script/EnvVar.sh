#!/bin/bash
# Copyright (C) 2000 ZeroDream

# --------------------------------------------------

# ZeroDreamEnv
ZD_DATE="$(TZ=UTC-8 date +"%y%m%d%H%M%S")" && echo "ZD_DATE=$ZD_DATE" >>$GITHUB_ENV

# LibraryPath
ZD_MainPath="$GITHUB_WORKSPACE/ZeroDream" && echo "ZD_MainPath=$ZD_MainPath" >>$GITHUB_ENV
ZD_LibPath="$ZD_MainPath/Library" && echo "ZD_LibPath=$ZD_MainPath/Library" >>$GITHUB_ENV
ZD_AppLibPath="$ZD_LibPath/Application" && echo "ZD_AppLibPath=$ZD_LibPath/Application" >>$GITHUB_ENV
ZD_ScriptLibPath="$ZD_LibPath/Script" && echo "ZD_ScriptLibPath=$ZD_LibPath/Script" >>$GITHUB_ENV

# --------------------------------------------------

# Source
source "$ZD_ScriptLibPath/CreateTempPath.sh"

# TempPath
tempPath="$RUNNER_TEMP/ZeroDream-$(uuidgen | tr -d '-')" && mkdir -p "$tempPath"
ZD_TempPath="$tempPath" && echo "ZD_TempPath=$tempPath" >>$GITHUB_ENV

# UploadReleasePath
releaseUploadPath=$(createTempPath 'UploadRelease')
ZD_ReleaseUploadPath="$releaseUploadPath" && echo "ZD_ReleaseUploadPath=$releaseUploadPath" >>$GITHUB_ENV

# UploadArtifactPath
artifactUploadPath=$(createTempPath 'UploadArtifact')
ZD_ArtifactUploadPath="$artifactUploadPath" && echo "ZD_ArtifactUploadPath=$artifactUploadPath" >>$GITHUB_ENV
