#!/bin/sh

# Exit the script on any command with non 0 return code
set -e

echo 'Source will be stored in repos/ folder.'

echo 'Cleaning previously stored assets ...'
rm -rf repos
mkdir repos
cd repos

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

for project in "${!projects[@]}"
do
  # $project - original project name, i.e. github repository name.
  echo "Cloning $project ..."
  git clone git@github.com:ec-europa/$project.git
  cd $project
  npm install
  cd ..
done
