PROMPT="%D{%m/%f/%y} %T %(?:%{$fg_bold[green]%}➜  :%{$fg_bold[red]%}➜  )"
if [[ "$user" != "$DEFAULT_USER" || -n "$SSH_CONNECTION" ]]; then
    PROMPT+="$USER@%m:"
fi
PROMPT+='%{$fg[cyan]%}%~%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
