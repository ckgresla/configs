## katsulab box theme
# avoid any spaces or funny business around colored text, ensure you use `"%{"` and `"}%"` to escape text and avoid corrupting the prompt
PROMPT=" %{$fg_bold[yellow]%}[katsulab] %(?:%{$fg_bold[green]%}ϟ:%{$fg_bold[red]%}ϟ)"
PROMPT+=' %{$fg[magenta]%}%~%{$reset_color%}$(git_prompt_info) '
#PROMPT+=' %{$fg[blue]%}%c%{$reset_color%} $(git_prompt_info) %{$fg_bold[yellow]%}ϟ '

# Git Repo Dirs, special prompt
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[white]%} git ∴ [%{$fg[red]%}"
# add spaces after the prompt for clean and dirty, separate info from command prompt to type in 
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[white]%}] %{$fg[yellow]%}..."
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[white]%}]"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

