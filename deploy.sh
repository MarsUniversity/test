#!/bin/bash
# https://github.com/travis-ci/dpl/blob/master/lib/dpl/provider/pages.rb

EMAIL="kevin.walchko@github.noreply.com"
USER="walchko"
REPO="github.com/MarsUniversity/test"
BRANCH="gh-pages"
TOKEN=$GITHUB_TOKEN

set -e

# rm -rf .git > /dev/null 2>&1

rm -f LICENSE
rm -f README.md
rm -f *.html

echo "hi" > index.html

if [[ -f ".gitignore" ]]; then
	rm .gitnore
fi

touch "deployed at `date`"
# git init
git config user.email ${EMAIL}
git config user.name ${USER}
git add *
git commit -m "Deploying to ${REPO}:${BRANCH}"
git push --force --quiet "https://${TOKEN}@${REPO}" master:${BRANCH} > /dev/null 2>&1
