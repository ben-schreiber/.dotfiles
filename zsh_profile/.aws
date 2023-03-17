alias ls3='aws s3 ls --human'
alias cp3='aws s3 cp'
alias rm3='aws s3 rm'
alias mv3='aws s3 mv'
alias mb3='aws s3 mb'
alias rb3='aws s3 rb'
alias aws_sso='~/code/internal-tools/control_tower_sso/x86_control_tower_sso/control_tower_sso'
export ENV=prod
export AWS_PROFILE=Eng-Prod

cat3() {
	aws s3 cp $1 -
}

cp_old_to_new() {
	echo "s3://$2/$1"
	aws s3 cp s3://$2/$1 /tmp/transfer --profile=default
	echo "s3://$3/$1"
	aws s3 cp /tmp/transfer s3://$3/$1 --profile=Eng-Prod
	rm -f /tmp/transfer
}

cp_old_to_dev() {
	echo "s3://$2/$1"
	aws s3 cp s3://$2/$1 /tmp/transfer --profile=default
	echo "s3://$3/$1"
	aws s3 cp /tmp/transfer s3://$3/$1 --profile=Eng-Dev
	rm -f /tmp/transfer
}

go-stage() {
    export AWS_PROFILE=Eng-Staging
    export ENV=stage
}

go-prod() {
    export AWS_PROFILE=Eng-Prod
    export ENV=prod
}
