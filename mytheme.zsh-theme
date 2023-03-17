current_time() {
   echo "%{$fg_bold[yellow]%}|%*|%{$reset_color%}"
}

function virtualenv_info { 
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

if [[ $TERM_PROGRAM == "WarpTerminal" ]]; then
PROMPT='%{$fg_bold[blue]%}$(virtualenv_info)%{$reset_color%}'
else
PROMPT=''
fi

PROMPT+='$(current_time) %{$fg_bold[cyan]%}%2~%{$reset_color%} $(git_prompt_info)'

if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
PROMPT+=$'\n'
PROMPT+="%(?:%{$fg_bold[blue]%}❯%{$fg_bold[cyan]%}❯%{$fg_bold[green]%}❯ :%{$fg_bold[yellow]%}❯%{$fg_bold[174]%}❯%{$fg_bold[red]%}❯ )%{$reset_color%}"
fi


#PROMPT+="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$reset_color%}"
#RPROMPT='$(current_time)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%})"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
