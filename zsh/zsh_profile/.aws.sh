alias ls3='aws s3 ls --human'
alias cp3='aws s3 cp'
alias rm3='aws s3 rm'
alias mv3='aws s3 mv'
alias mb3='aws s3 mb'
alias rb3='aws s3 rb'

cat3() {
	aws s3 cp "$1" -
}

go-dev() {
    export AWS_PROFILE=Eng-Dev
    export ENV=dev
}

go-stage() {
    export AWS_PROFILE=Eng-Staging
    export ENV=stage
}

go-prod() {
    export AWS_PROFILE=Eng-Prod
    export ENV=prod
}
