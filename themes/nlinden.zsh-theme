autoload colors && colors
for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
    eval $COLOR='%{$fg_no_bold[${(L)COLOR}]%}'  #wrap colours between %{ %} to avoid weird gaps in autocomplete
    eval BOLD_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
done
eval RESET='%{$reset_color%}'

if [[ $UID -eq 0 ]]; then
    local user_host='%{$terminfo[bold]$fg[red]%}%n@%m %{$reset_color%}'
    local user_symbol='#'
else
    local user_host='%{$terminfo[bold]$fg[white]%}%n@%m '
    local user_symbol=%{$terminfo[bold]$fg[blue]%}'►'
fi

local current_dir='%{$terminfo[bold]$fg[red]%}%~%{$reset_color%}'

ZSH_THEME_RVM_PROMPT_OPTIONS="i v g"

PROMPT="$terminfo[bold]%{$fg[blue]╭─[%T%} "
# PROMPT+="%{$fg[white]${user_host}${current_dir}${git_branch}${venv_prompt}$terminfo[bold]%}%{$fg[red]]%}"
PROMPT+="%{$fg[white]${user_host}${current_dir}%}%{$fg[red]]%}"
PROMPT+=' $(git_prompt_info)'
PROMPT+="
%{$terminfo[bold]$fg[blue]%}╰─%B${user_symbol}%b "
# PROMPT+='$(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"


