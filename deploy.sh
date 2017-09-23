#!/bin/bash
# https://github.com/travis-ci/dpl/blob/master/lib/dpl/provider/pages.rb

EMAIL="kevin.walchko@github.noreply.com"
USER="walchko"
REPO="github.com/MarsUniversity/test"
BRANCH="gh-pages"
TOKEN=$GITHUB_TOKEN
FOLDER="www"
TMP="../tmpdir"

set -e

# ls -al ../
# mkdir ../tmpdir
# touch ../tmpdir/test.txt
# ls -al ../tmpdir

mkdir -p ${TMP}

# echo "nuked git"
# rm -rf .git > /dev/null 2>&1
#
# rm -f LICENSE
# rm -f README.md
# rm -f *.html
#
# if [[ -f ".gitignore" ]]; then
# 	rm .gitnore
# fi

mkdir -p ${FOLDER}

cd ${FOLDER}

echo "creating web page"
echo "hi: `date`" > index.html
echo "deployed at `date`" > README

cd ..

cp ${FOLDER}/* ${TMP}

cd ${TMP}

echo "redoing git"
git init
git config user.email ${EMAIL}
git config user.name ${USER}
git add *
git commit -m "Deploying to ${REPO}:${BRANCH}"
git push --force --quiet "https://${TOKEN}@${REPO}" master:${BRANCH} > /dev/null 2>&1
