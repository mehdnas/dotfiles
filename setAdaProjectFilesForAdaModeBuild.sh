#!/bin/bash

# Build and install the libiconv library from source (gnu)

# Clone projects in the ada-mode directory and checkout a realease
PROJECTS_DIR=/home/mehdi/.dotfiles/.emacs.d/elpa/ada-mode-7.2.0

PROJECTS=( "gnatcoll-db/sqlite/"
           "gnatcoll-db/xref/"
           "gnatcoll-core/"
           "gprbuild/gpr/" # Build and install xmlada
           "gnatcoll-db/sql/"
           "gnatcoll-bindings/iconv" )

for PROJECT in "${PROJECTS[@]}"
do
    ADA_PROJECT_PATH="$PROJECTS_DIR/$PROJECT:$ADA_PROJECT_PATH"
done

export ADA_PROJECT_PATH
