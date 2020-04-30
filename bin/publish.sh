#!/bin/bash

set -ex

get-username() {
    local repo="$1"
    
    # Handle clone URLs of the following forms:
    #
    #   git@github.com:user/repo.git
    #   ssh://git@github.com/user/repo.git
    #   https://github.com/user/repo.git
    #
    if [[ $repo =~ ^git@github\.com:([^/]+) ]] ||
       [[ $repo =~ ^[[:alpha:]]+://.*github\.com/([^/]+) ]]; then
        echo "${BASH_REMATCH[1]}"
    else
        echo "unknown"
        return 1
    fi
}

GITHUB_REPO_URL="$(git remote get-url origin)"
GITHUB_USER="$(get-username ${GITHUB_REPO_URL})"
GITHUB_AUTHOR="gh-pages-publisher <${GITHUB_USER}@users.noreply.github.com>"
COMMIT_HASH=$(git rev-parse --short=8 HEAD)

rm -rf gh-pages
mkdir gh-pages
cd gh-pages

git init -q
git checkout -q -b gh-pages
ln ../swagger-ui/{bitwarden.yaml,favicon*,*.html,swagger-ui*.{js,css}} .
git add .
git commit -q -m "Publish commit ${COMMIT_HASH}" --author="${GITHUB_AUTHOR}"
git remote add origin "${GITHUB_REPO_URL}"
git push -f origin gh-pages
