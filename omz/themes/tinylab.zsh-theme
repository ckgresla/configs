## theme for the tinylab

PROMPT=" "
PROMPT+='%{$fg_bold[white]%}%~%{$reset_color%}$(git_prompt_info) %(?:%{$fg_bold[green]%}+:%{$fg_bold[red]%}-)%{$reset_color%} '

# Git Repo Dirs, special prompt
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[white]%} git @ [%{$fg[red]%}"
# add spaces after the prompt for clean and dirty, separate info from command prompt to type in
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[white]%}] %{$fg[yellow]%}..."
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[white]%}]"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

