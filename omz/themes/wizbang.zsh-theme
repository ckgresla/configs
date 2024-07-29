## ckg's macos zsh theme 
# avoid any spaces or funny business around colored text, ensure you use `"%{"` and `"}%"` to escape text and avoid corrupting the prompt
PROMPT=" %(?:%{$fg_bold[green]%}♥:%{$fg_bold[red]%}♥)"
PROMPT+=' %{$fg[blue]%}%c%{$reset_color%}$(git_prompt_info) '
#PROMPT+=' %{$fg[blue]%}%c%{$reset_color%} $(git_prompt_info) %{$fg_bold[yellow]%}ϟ '

# Git Repo Dirs, special prompt
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%} git::[%{$fg[red]%}"
#ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git::(%{$fg[red]%}" #og
# add spaces after the prompt for clean and dirty, separate info from command prompt to type in 
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}] %{$fg[yellow]%}<-"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}]"

