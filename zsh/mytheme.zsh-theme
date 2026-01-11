current_time() {
   echo "%{$fg_bold[green]%}|%*|%{$reset_color%}"
}

#function virtualenv_info { 
#    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
#}

function working_dir() {
    git_repo=""
    if git rev-parse --is-inside-work-tree &> /dev/null; then
        top_level=$(git rev-parse --show-toplevel 2> /dev/null)
        git_repo=${top_level##*/}       # remove everything before the last / that still remains
        git_repo="$git_repo.."
    fi
    if [ "$HOME" = "$PWD" ]; then
        curr_dir="~"
    else
        curr_dir=${PWD##*/}
        curr_dir=${curr_dir:-/} 
    fi
    echo "%{$fg_bold[cyan]%}$git_repo$curr_dir%{$reset_color%}"
}

function get_current_branch() {
    #branch_name=$(git branch --show-current 2> /dev/null | tr -d '\n')
    branch_name=$(git rev-parse --abbrev-ref --symbolic-full-name HEAD 2> /dev/null | tr -d '\n')
    if [ "$branch_name" = "HEAD" ]; then
        tag_name=$(git tag --points-at HEAD 2> /dev/null | tr -d '\n')
        if [ "$tag_name" != "" ]; then 
            branch_name=$tag_name
        fi
    fi
    if git rev-parse --is-inside-work-tree &> /dev/null; then
         echo "%{$fg_bold[green]%}->%{$reset_color%} %{$fg_bold[red]%}$branch_name%{$reset_color%}"
    fi
}

PROMPT='$(working_dir) $(get_current_branch)'
PROMPT+=$'\n'
PROMPT+="%(?:%{$fg_bold[blue]%}❯ :%{$fg_bold[red]%}❯ )%{$reset_color%}"

