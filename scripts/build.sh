#!/bin/sh

# Exit the script on any command with non 0 return code
set -e

# Set root directory for all projects.
digitecDirectory="digitec"

echo 'Cleaning previous builds and rebuilding ...'
rm -rf $digitecDirectory
mkdir $digitecDirectory

declare -A projects=(
  [digit-ict-conf-2016]=2016
  [digitec]=2018
  [digitec-news]=news
)

declare -A buildScripts=(
  [digit-ict-conf-2016]=build
  [digitec]=build:prefixed
  [digitec-news]=build:prefixed
)

declare -A buildFolders=(
  [digit-ict-conf-2016]=build
  [digitec]=public
  [digitec-news]=public
)

# Go to folder with sources.
cd repos

for project in "${!projects[@]}"
do
  cd $project
  rm -rf .cache build public
  # Run the build script of a given project.
  npm run ${buildScripts[$project]}
  # Move a given build folder up one level and name it project-specifically.
  mv ${buildFolders[$project]} ../../$digitecDirectory/${projects[$project]}
  cd ..
done
