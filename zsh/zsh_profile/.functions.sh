parse_git_branch() {
    git branch --show-current
}

get_default_branch() {
    git rev-parse --abbrev-ref origin/HEAD | cut -c8- | tr -d '\n'
}

rebase() {
    if [ $# -eq 0 ] 
    then 
        BRANCH=$(get_default_branch)
	else
		BRANCH="$1"
	fi 
    CURR_BRANCH=$(parse_git_branch)
    echo "Rebasing branch '$CURR_BRANCH' on '$BRANCH'"
    sleep 1
	git fetch origin "$BRANCH" && \
    git rebase "origin/$BRANCH"
}

rgf() {
    rebase "$@" && \
    git push -f
}

copy() {
    cat "$1" | pbcopy
}

merge() {
    if [ $# -eq 0 ] 
    then 
        BASE_BRANCH=$(get_default_branch)
	else
		BASE_BRANCH="$1"
	fi
    CURR_BRANCH=$(parse_git_branch)
    echo "Merging branch '$CURR_BRANCH' into '$BASE_BRANCH'"
    sleep 2
    git checkout "$BASE_BRANCH" && \
    git fetch origin "$BASE_BRANCH" && \
    git reset --hard "origin/$BASE_BRANCH" && \
    git merge --ff-only "$CURR_BRANCH" && \
    git push
}

black_and_isort() {
    black -l 120 "$@" &&  \
    isort -l 120 --profile black "$@"
}


create_pyenv() {
    venv_name=$(basename $PWD)
    echo "Creating venv with name $venv_name"
    sleep 2
    pyenv virtualenv 3.10.12 $venv_name
    pyenv local $venv_name
}
