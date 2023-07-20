
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

PROMPT="╭─${user_host}${current_dir}${rvm_ruby}${vcs_branch}${venv_prompt}
╰─%B${user_symbol}%b "
# =======
PROMPT="$terminfo[bold]$fg[blue]╭─[%T $fg[white]${user_host}${current_dir}${git_branch}${venv_prompt}$terminfo[bold]$fg[red]]
%{$terminfo[bold]$fg[blue]%}╰─%B${user_symbol}%b "

