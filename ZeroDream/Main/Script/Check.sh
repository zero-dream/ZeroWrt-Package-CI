#!/bin/bash
# Copyright (C) 2000 ZeroDream

# --------------------------------------------------

# CheckScript
find "$GITHUB_WORKSPACE/" -type f \
  -iregex ".*\.\(sh\|hook\)$" \
  -exec dos2unix {} \; \
  -exec chmod +x {} \;
find "$GITHUB_WORKSPACE/ZeroDream/" -type f \
  ! -name '.gitkeep' \
  -exec chmod +x {} \;
