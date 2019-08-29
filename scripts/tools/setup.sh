#!/bin/sh

## Set proper site UUID
#-drush --root=docroot/ -y cset system.site uuid a638feda-1543-47ed-8253-80fbd690e315

# Git hooks folder
GIT_HOOKS_FOLDER=.git/hooks

### Git hooks ####
if [ -d "$GIT_HOOKS_FOLDER" ]; then
  # Post merge hook.
  cp scripts/tools/post-merge .git/hooks/post-merge
  # Make files executable.
  # Used only for dev env.
  chmod +x .git/hooks/post-merge
fi
### End Git hooks ####
