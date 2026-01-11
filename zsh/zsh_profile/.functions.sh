
function parse_git_branch() {
  git branch --show-current
}

function get_default_branch() {
  git remote show origin | grep "HEAD branch: " | cut -c16- | tr -d '\n'
}

function rebase() {
  if [ $# -eq 0 ]; then
    BRANCH=$(get_default_branch)
  else
    BRANCH="$1"
  fi
  CURR_BRANCH=$(parse_git_branch)
  echo "Rebasing branch '${CURR_BRANCH}' on '${BRANCH}'"
  sleep 1
  git fetch -p &&
    git rebase "origin/${BRANCH}"
}

function rgf() {
  rebase "$@" &&
    git push -f
}

function gaap() {
  git commit -a --amend --no-edit && git push -f
}
