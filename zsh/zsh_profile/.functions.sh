parse_git_branch() {
    git branch --show-current
}

get_default_branch() {
    git rev-parse --abbrev-ref origin/HEAD | cut -c8- | tr -d '\n'
}

function download_logs {
     export VIRTUAL_CLUSTER_ID=f7ra6rarkleapxysng71scsl1
     LOG_BASE_URI="s3://pgy-luigi-emr-prod/logs/eks/joblogs/$1"
     PODS_LOG_LOCATION="$LOG_BASE_URI/$VIRTUAL_CLUSTER_ID/jobs/$2/"
     DRIVER_POD="spark-$2-driver"
     DRIVER_LOG_LOCATION="${PODS_LOG_LOCATION}containers/spark-$2/${DRIVER_POD}/"
     TARGET_FOLDER="/tmp/spark_logs/$2"
     mkdir -p $TARGET_FOLDER
     aws s3 cp $DRIVER_LOG_LOCATION $TARGET_FOLDER --recursive
     find $TARGET_FOLDER -name *.gz -exec gunzip {} +
     echo "cat $TARGET_FOLDER/stdout"
     echo "cat $TARGET_FOLDER/stderr"
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
