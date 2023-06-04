rebase() {
    if [ $# -eq 0 ] 
    then 
        BRANCH="master"
	else
		BRANCH=$1
	fi 
	git fetch origin $BRANCH && git rebase origin/$BRANCH
}

copy() {
    cat $1 | pbcopy
}

parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p' | sed 's/\[//' | sed 's/\]$//'
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
    git reset --hard origin/$BASE_BRANCH && \
    git merge --ff-only $CURR_BRANCH && \
    git push
}
