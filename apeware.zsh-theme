# ApeWare Theme
# combines the best of Bira and
# Steve Losh's (http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/)
# "Extravagant" theme

function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    echo '○'
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

local return_status="%{$fg[red]%}%(?..✘)%{$reset_color%}"
local user="%{$fg[magenta]%}%n%{$reset_color%}"
local host="%{$fg[yellow]%}%m%{$reset_color%}"
local git_branch='$(git_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[red]%}⚡%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$fg_bold[red]%}?%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD=" %{$fg_bold[red]%}!%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg_bold[green]%}✓%{$reset_color%}"

RPROMPT='${return_status}%{$reset_color%}'
PROMPT='
╭─${user} at ${host} in %{$fg_bold[green]%}$(collapse_pwd)%{$reset_color%} $(git_prompt_info)
╰─$(virtualenv_info)$(prompt_char) '