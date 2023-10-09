rebase() {
    if [ $# -eq 0 ] 
    then 
        BRANCH="master"
	else
		BRANCH=$1
	fi 
    CURR_BRANCH=$(parse_git_branch)
    echo "Rebasing branch '$CURR_BRANCH' on '$BRANCH'"
    sleep 1
	git fetch origin $BRANCH && \
    git rebase origin/$BRANCH
}

rgf() {
    rebase "$@" && \
    git push -f
}

copy() {
    cat $1 | pbcopy
}

parse_git_branch() {
    git branch --show-current
}

merge() {
    CURR_BRANCH=$(parse_git_branch)
    if [ $# -eq 0 ] 
    then 
        BASE_BRANCH="master"
	else
		BASE_BRANCH=$1
	fi
    echo "Merging branch '$CURR_BRANCH' into '$BASE_BRANCH'"
    sleep 2
    git checkout $BASE_BRANCH && \
    git fetch origin $BASE_BRANCH && \
    git reset --hard origin/$BASE_BRANCH && \
    git merge --ff-only $CURR_BRANCH && \
    git push
}
